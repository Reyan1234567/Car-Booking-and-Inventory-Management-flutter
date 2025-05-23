import 'package:flutter/material.dart';
import 'package:flutterpolo/Domain/entities/Signup.dart';
import 'package:flutterpolo/Presentation/Screens/AccountScreen.dart';
import 'package:flutterpolo/Presentation/Screens/LoginScreen.dart';
import 'package:flutterpolo/Presentation/Screens/SignUpScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterpolo/Presentation/Screens/SignUpScreen1.dart';

import 'Presentation/Screens/AccountScreen1.dart';
import 'Presentation/Screens/hompageScreen.dart';

void main() {
  runApp(const MyApp());
}

final _router=GoRouter(
  routes:[
    GoRoute(
        path:'/',
        builder:(context,state)=>Hompagescreen()
    ),
    GoRoute(
        path:'/signup',
        builder:(context,state)=>Signupscreen()
    ),
    GoRoute(
        path:'/account',
        builder:(context,state)=>AccountScreen()
    ),
    GoRoute(
        path:'/account1',
        builder:(context,state)=>Accountscreen1()
    ),
    GoRoute(
        path:"/signup1",
        builder:(context, state){
          final user1=state.extra as SignupPart1;
          return Signupscreen1(userInfo:user1);
        }
    )
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFEA6307)),
        fontFamily:'InterLight',
      ),
      routerConfig: _router,
    );
  }
}


