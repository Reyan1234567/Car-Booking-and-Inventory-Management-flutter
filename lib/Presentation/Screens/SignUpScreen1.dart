import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpolo/Presentation/widgets/TextButton.dart';
import 'package:flutterpolo/Presentation/widgets/TextFields.dart';

class Signupscreen1 extends StatefulWidget {
  const Signupscreen1({super.key});

  @override
  State<Signupscreen1> createState() => _Signupscreen1State();
}

class _Signupscreen1State extends State<Signupscreen1> {
  String usernameErr='';
  String passwordErr='';
  String repasswordErr='';

  final usernameController=TextEditingController();
  final passwordController=TextEditingController();
  final rePasswordController=TextEditingController();

  void _handleSignup(){
    if(validateUsername(usernameController.text)==''&& validatePassword(passwordController.text)==''&&validateRePassword(rePasswordController.text, passwordController.text)==''){

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
    if(validateRePassword(rePasswordController.text, passwordController.text)!=''){
      setState(() {
        repasswordErr=validateRePassword(passwordController.text, passwordController.text);
      });
    }
    else{
      setState(() {
        repasswordErr='';
      });
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:SizedBox.expand(
        child:Padding(padding:EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
                'assets/images/polo.png',
                width: 70,
                height:80,
                fit:BoxFit.contain
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("SignUp", style: TextStyle(fontFamily: 'InterBold', fontSize:20),),
              ],
            ),
            SizedBox(height: 10,),
            customTextField(usernameController, TextInputType.text, "Username", false, "JohnDoe"),
            Row(),
            SizedBox(height: 10,),
            customTextField(passwordController, TextInputType.text, "Password", true, "**********"),
            Row(),
            SizedBox(height: 10,),
            customTextField(rePasswordController, TextInputType.text, "Re-Enter Password", true, "**********"),
            Row(),
            SizedBox(height: 10,),
            customTextButton(()=>{}, "Sign-up")
          ],
        ),
      )
    )
  );
}}
