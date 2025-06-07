import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpolo/Presentation/widgets/TextButton.dart';
import 'package:flutterpolo/Presentation/widgets/bottomNavbar.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("Profile", style: TextStyle(fontFamily: 'InterBold'),)),
        actions:[
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.exit_to_app), color:Colors.red)
        ],
      ),
      bottomNavigationBar: bottomNavBar(),
      body:
      SizedBox(
        height: double.infinity,
        width:double.infinity,
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 140,),
            SizedBox(height:5,),
            Text("Tesnim", style: TextStyle(fontFamily: 'InterBold', fontSize:25, color: Colors.black),),
            SizedBox(height:5,),
            Text("tesnim@gmail.com", style: TextStyle(fontFamily: 'InterLight', fontSize:15, )),
            SizedBox(height:5,),
            Text("0912345678", style: TextStyle(fontFamily: 'InterLight', fontSize:15, )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Card(color: Colors.orange,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10), child:SizedBox(width: double.infinity,child: customTextButton(()=>{context.push('/account1')}, "Edit Profile")) ,)
          ],
        ),
      ),
    );

  }
}
