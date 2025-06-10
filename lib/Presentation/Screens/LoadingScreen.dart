import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Data/Store/DataSource.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  @override
  void initState(){
    super.initState();
    _initializeApp();
  }
  Future<void> _initializeApp() async{
    final _dio=Dio();
    final username= await Store.getUsername();
    final role=await Store.getRole();
    final accessToken = await Store.getAccessToken();

    try{
      final response = await _dio.get(
        "http://localhost:4000/checkAccessToken",
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 && username != "") {
        if (role == "user") {
          context.go("/home");
        } else {
          context.go("/adminHome");
        }
      } else {
        context.go("/login");
      }
    }
    catch(e){
      print(e.toString());
      context.go("/login");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CircularProgressIndicator()
        )
    );
  }
}
