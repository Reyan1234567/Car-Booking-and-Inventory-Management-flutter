import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Data/models/signup_model.dart';
import 'package:flutterpolo/Domain/entities/Signup.dart';
import 'package:flutterpolo/Presentation/providers/signup/signup_notifier.dart';
import 'package:flutterpolo/Presentation/providers/signup/signup_provider.dart';
import 'package:flutterpolo/Presentation/widgets/TextButton.dart';
import 'package:flutterpolo/Presentation/widgets/TextFields.dart';
import 'package:go_router/go_router.dart';

import '../providers/signup/signup_state.dart';
import '../widgets/SnackBar.dart';

class Signupscreen1 extends ConsumerStatefulWidget {
  final SignupPart1 userInfo;
  const Signupscreen1({super.key, required this.userInfo});

  @override
  ConsumerState<Signupscreen1> createState() => _Signupscreen1State();
}

class _Signupscreen1State extends ConsumerState<Signupscreen1> {
  bool isLoading=false;
  String usernameErr='';
  String passwordErr='';
  String repasswordErr='';

  final usernameController=TextEditingController();
  final passwordController=TextEditingController();
  final rePasswordController=TextEditingController();

  void _handleSignup(){
    final user = widget.userInfo;
    
    // First validate all fields
    final usernameError = validateUsername(usernameController.text);
    final passwordError = validatePassword(passwordController.text);
    final repasswordError = validateRePassword(rePasswordController.text, passwordController.text);
    
    // Update error states
    setState(() {
      usernameErr = usernameError;
      passwordErr = passwordError;
      repasswordErr = repasswordError;
    });
    
    // Only proceed with signup if all validations pass
    if(usernameError.isEmpty && passwordError.isEmpty && repasswordError.isEmpty) {
      final signupBody = SignupRequestModel(
        usernameController.text, 
        passwordController.text, 
        user.phoneNumber, 
        user.email, 
        user.birthDate, 
        user.lastName, 
        user.firstName
      );
      ref.read(SignupNotifierProvider.notifier).Signup(signupBody);
    }
  }

  String validateUsername(String username){
    if(username.isEmpty){
      return "Username is required";
    }
    else if(username.length<6){
      return "Username must be 6 characters at least";
    }
    else if(username.length>20){
      return "Username must be 19 characters at most";
    }
    else{
      return '';
    }
  }

  String validatePassword(String username){
    if(username.isEmpty){
      return "Password is required";
    }
    else if(username.length<6){
      return "Password must be 6 characters at least";
    }
    else if(username.length>20){
      return "Password must be 19 characters at most";
    }
    else{
      return '';
    }
  }

  String validateRePassword(String repassword, String password){
    if(repassword.isEmpty){
      return "re-Enter password is required";
    }
    else if(repassword!=password){
      return "Enter the same password as the above one";
    }
    else{
      return '';
    }
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SignupState>(SignupNotifierProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          )
        );
      }
      if (next.error == null && next.signupResponse != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Signup successful! You can now login"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          )
        );
        // Add a small delay to ensure the snackbar is visible
        Future.delayed(Duration(seconds: 1), () {
          context.go('/login');
        });
      }
      if (next.error == null && next.isLoading != previous?.isLoading) {
        setState(() {
          isLoading = next.isLoading;
        });
      }
    });
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                    'assets/images/polo.png',
                    width: 70,
                    height: 80,
                    fit: BoxFit.contain
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("SignUp", style: TextStyle(fontFamily: 'InterBold', fontSize: 20)),
                  ],
                ),
                SizedBox(height: 10),
                customTextField(usernameController, TextInputType.text, "Username", false, "JohnDoe"),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Text(usernameErr, style: TextStyle(color: Colors.red, fontSize: 10))
                    ]
                ),
                SizedBox(height: 10),
                customTextField(passwordController, TextInputType.text, "Password", true, "**********"),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Text(passwordErr, style: TextStyle(color: Colors.red, fontSize: 10))
                    ]
                ),
                SizedBox(height: 10),
                customTextField(rePasswordController, TextInputType.text, "Re-Enter Password", true, "**********"),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Text(repasswordErr, style: TextStyle(color: Colors.red, fontSize: 10))
                    ]
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed:_handleSignup,
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFEA6307),
                    foregroundColor: Colors.white,
                    padding:EdgeInsets.symmetric(horizontal:20, vertical: 15),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child:isLoading ? CircularProgressIndicator() : Text("Signup"),
                )              ],
            ),
          ),
        )
    );
  }
}
