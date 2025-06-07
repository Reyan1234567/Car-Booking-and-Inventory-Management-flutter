import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpolo/Presentation/widgets/TextButton.dart';
import 'package:flutterpolo/Presentation/widgets/TextFields.dart';
import 'package:go_router/go_router.dart';

class Accountscreen1 extends StatefulWidget {
  const Accountscreen1({super.key});

  @override
  State<Accountscreen1> createState() => _Accountscreen1State();
}

class _Accountscreen1State extends State<Accountscreen1> {
  final usernameController=TextEditingController();
  final emailController=TextEditingController();
  final phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(onPressed:()=>{context.pop()},icon: Icon(Icons.arrow_back_ios)),
        title: Center(child: Text("Profile")),
      ),
      body:SizedBox(height: double.infinity, width: double.infinity,
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment:Alignment.bottomRight,
               children: [
                 Icon(Icons.account_circle,size: 150,),
                 Icon(Icons.add_circle)

               ],
              ),
              customTextField(usernameController, TextInputType.text, "Username", false, "Enter a new username"),
              SizedBox(height: 5,),
              customTextField(emailController, TextInputType.text, "Email", false, "Enter a new email"),
              SizedBox(height: 5,),
              customTextField(phoneController, TextInputType.text, "Phone Number", false, "Enter a new phoneNumber"),
              SizedBox(height: 5,),
              SizedBox(width:double.infinity, height: 200,child: Card(child:Column(children: [Text("LicensePhoto"), TextButton(onPressed: ()=>{}, child: Text("Upload"))])),),
              SizedBox(height: 5,),
              customTextButton(()=>{},"Save changes")
            ],
          ),
        ),
      ),
    );
  }
}
