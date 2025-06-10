import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
    final response=await _dio.get("http://localhost:4000/checkAccessToken");
    if(response is! Error && username!=""){
      if(role=="user"){
        context.go("/home");
      }
      else{
        context.go("/adminHome");

      }
    }
    else{
      context.go("/login");
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
