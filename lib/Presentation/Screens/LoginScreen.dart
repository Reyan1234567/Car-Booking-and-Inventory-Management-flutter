import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Domain/entities/login.dart';
import 'package:flutterpolo/Presentation/widgets/SnackBar.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterpolo/Presentation/widgets/TextButton.dart';
import 'package:flutterpolo/Presentation/widgets/TextFields.dart';

import '../providers/login/login_providers.dart';
import '../providers/login/login_state.dart';

class Loginscreen extends ConsumerStatefulWidget {
  const Loginscreen({super.key});

  @override
  ConsumerState<Loginscreen> createState() => _LoginscreenState();
}
class _LoginscreenState extends ConsumerState<Loginscreen> {
  bool isLoading=false;

  String usernameErr='';
  String passwordErr='';
  bool obsecureText=true;
  dynamic changeObsecuritiy(){
    setState(() {
      obsecureText=!obsecureText;
    });
  }
  final usernameController=TextEditingController();
  final passwordController=TextEditingController();

  String validateUsername(String username){
    if(username.isEmpty){
      return "Username is required";
    }
    else{
      return '';
    }
  }
  String validatePassword(String password){
    if(password.isEmpty){
      return "Password is required";
    }
    else{
      return '';
    }
  }
  void _handleLogin(){
    if(validatePassword(passwordController.text)=='' && validateUsername(usernameController.text)==''){
      final loginRequest=LoginRequest(usernameController.text, passwordController.text);
      ref.read(loginNotifierProvider.notifier).login(loginRequest);
    }
    if(validateUsername(usernameController.text)!=''){
      setState(() {
        usernameErr=validateUsername(usernameController.text);
      });
    }
    else{
      setState(() {
        usernameErr='';
      });
    }
    if(validatePassword(passwordController.text)!=''){
      setState(() {
        passwordErr=validatePassword(passwordController.text);
      });
    }
    else{
      setState(() {
        passwordErr='';
      });
    }
  }
  @override
  void dispose(){
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    ref.listen<LoginState>(loginNotifierProvider,(previous, next){
      if(next.error!=null){
        customSnackBar(context, "$next.error",Color(0xFFFF0000));
      }
      if(next.error==null && next.loginResponse!=null){
        customSnackBar(context, "Welcome ${next.loginResponse?.user.username}", Color(0xFF008000));
        context.go('/home');
      }
      if(next.error==null && next.isLoading!=previous?.isLoading){
        setState(() {
          isLoading=next.isLoading;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox.expand(
        child:Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
              'assets/images/polo.png',
            width: 50,
            height: 100,
            fit:BoxFit.contain
          ),
          SizedBox(height: 105),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login", style: TextStyle(fontFamily: 'InterBold', fontSize:20),),
            ],
          ),
          SizedBox(height: 16),
          customTextField(usernameController, TextInputType.text, "Username", false,''),
          Row(mainAxisAlignment:MainAxisAlignment.start,children:[SizedBox(width: 10,), Text(usernameErr, style: TextStyle(color: Colors.red, fontSize: 10),)]),
          SizedBox(height: 10,),
            TextField(
              style: TextStyle(fontFamily:'InterBold'),
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: obsecureText,
              decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(onPressed: changeObsecuritiy, icon:obsecureText? Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined)),
                  labelStyle: TextStyle(fontFamily: 'InterBold', color: Color(0xFF9D9D9D)),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:BorderSide(
                        color:Colors.red,
                        width:1
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color:Color(0xFFC3C3C3),
                          width:1.0
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.
                      circular(12),
                      borderSide: BorderSide(
                          color:Colors.orange.shade600,
                          width:2.0
                      )
                  )
              ),
            ),
          Row(mainAxisAlignment:MainAxisAlignment.start,children:[SizedBox(width: 10,), Text(passwordErr, style: TextStyle(color: Colors.red,fontSize:10),)]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Forgot Password?", style: TextStyle(color: Colors.blue.shade500)),
              SizedBox(width:10,)
            ],
          ),
          SizedBox(height:20),
          customTextButton(_handleLogin, isLoading?CircularProgressIndicator():"Login"),
          SizedBox(height:20),
          Row(mainAxisAlignment:MainAxisAlignment.center,children:[Text("Dont have an account?"),TextButton(onPressed:(){context.go("/signup");}, child:Text(" Signup", style: TextStyle(color: Colors.blue.shade500)))]),
        ],
      )
          ,),
      )
    );
  }
}
