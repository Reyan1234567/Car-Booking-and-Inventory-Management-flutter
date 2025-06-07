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
  initialLocation: '/l',
  routes:[
    ShellRoute(
        routes:[
        GoRoute(
          path:'/',
          builder:(context,state)=>Hompagescreen()
      ),
        GoRoute(
            path:'/account',
            builder:(context,state)=>AccountScreen()
        ),
    ],
      builder: (context, state, child){
          return Default(child:child);
      }
    ),
    GoRoute(
        path:'/signup',
        builder:(context,state)=>Signupscreen()
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

class Default extends StatefulWidget {
  final Widget child;

  const Default({super.key, required this.child});
  @override
  State<Default> createState() => _DefaultState();
}

class _DefaultState extends State<Default>{
  var currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(destinations:
      [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home', ),
        NavigationDestination(icon: Icon(Icons.history), label: 'History'),
        NavigationDestination(icon: Icon(Icons.bookmark_border), label: 'Account',)
      ],
      selectedIndex: currentIndex,
        onDestinationSelected:(int index) {
          if (index == 0) {
            setState(() {
              currentIndex= index;
            });
            context.go('/');
          }
          else if (index == 1) {
            setState(() {
              currentIndex= index;
            });
            context.go('/history');
          }
          else if (index == 2) {
            setState(() {
              currentIndex=index;
            });
            context.go('/account');
          }
        }),
    );
  }
}




