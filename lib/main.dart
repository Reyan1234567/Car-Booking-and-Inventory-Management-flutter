import 'package:flutter/material.dart';
import 'package:flutterpolo/Presentation/Screens/LoginScreen.dart';
import 'package:flutterpolo/Presentation/Screens/SignUpScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterpolo/Presentation/Screens/SignUpScreen1.dart';

void main() {
  runApp(const MyApp());
}

final _router=GoRouter(
  routes:[
    // GoRoute(
    //   path:'/',
    //   builder:(context,state)=>HomPage()
    // ),
    GoRoute(
        path:'/',
        builder:(context,state)=>Loginscreen()
    ),
    GoRoute(
        path:'/signup',
        builder:(context,state)=>Signupscreen()
    ),
    GoRoute(
        path:"/signup1",
        builder:(context, state)=>Signupscreen1()
    )
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFEA6307)),
        fontFamily:'InterLight',
      ),
      routerConfig: _router,
    );
  }
}


