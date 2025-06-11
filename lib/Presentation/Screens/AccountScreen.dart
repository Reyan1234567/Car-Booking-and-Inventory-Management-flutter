import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpolo/Presentation/widgets/TextButton.dart';
import 'package:go_router/go_router.dart';

import '../../Data/Store/DataSource.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  Future<InfoDisplay> fetchUserInfo() async {
    final username= await Store.getUsername();
    final email=await Store.getEmail();
    final phone=await Store.getPhone();
    if(username!="" && email!="" && phone!=""){
      return InfoDisplay(username, email, phone);
    }
    else{
      throw Exception('Failed to load');
    }
  }

  late Future<InfoDisplay> userInfo;

  @override
  void initState(){
    super.initState();
    userInfo=fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("Profile", style: TextStyle(fontFamily: 'InterBold'),)),
        actions:[
          IconButton(onPressed: () {
            context.push('/beforelogout');
          }, icon: Icon(Icons.exit_to_app), color:Colors.red)
        ],
      ),
      body:
      SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 140,),
            const SizedBox(height: 10),
            FutureBuilder<InfoDisplay>(future: userInfo, builder: (BuildContext context, AsyncSnapshot<InfoDisplay> snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(child: LinearProgressIndicator(),);
              }
              else if(snapshot.hasData){
                return Column(
                    children:[
                      Text(snapshot.data!.username, style: const TextStyle(fontFamily: 'InterBold', fontSize:25, color: Colors.black),),
                    const SizedBox(height:5,),
                    Text(snapshot.data!.email, style: const TextStyle(fontFamily: 'InterLight', fontSize:15, )),
                    const SizedBox(height:5,),
                    Text(snapshot.data!.phoneNumber, style: const TextStyle(fontFamily: 'InterLight', fontSize:15, ))]
                );
              }
              else {
                return const Icon(Icons.no_accounts);
              }
            }),
            const SizedBox(height: 20),
            Card(
              color: Colors.orange,
              shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),
              child: const SizedBox(
                width: double.infinity,
                height: 200,
                child: Center(child: Text("Placeholder for more info")), // Placeholder content
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: customTextButton(()=>{context.push('/account1')}, "Edit Profile"))
          ],
        ),
      ),
    );

  }
}

class InfoDisplay{
  final String username;
  final String email;
  final String phoneNumber;

  InfoDisplay(this.username, this.email, this.phoneNumber);
}