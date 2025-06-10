import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterpolo/Domain/entities/Signup.dart';
import 'package:flutterpolo/Presentation/Screens/AccountScreen.dart';
import 'package:flutterpolo/Presentation/Screens/LoadingScreen.dart';
import 'package:flutterpolo/Presentation/Screens/LoginScreen.dart';
import 'package:flutterpolo/Presentation/Screens/SignUpScreen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterpolo/Presentation/Screens/SignUpScreen1.dart';

import 'Presentation/Screens/AccountScreen1.dart';
import 'Presentation/Screens/AdminHomeScreen.dart';
import 'Presentation/Screens/BookingsScreen.dart';
import 'Presentation/Screens/CarsScreen.dart';
import 'Presentation/Screens/HistoryScreen.dart';
import 'Presentation/Screens/UsersScreen.dart';
import 'Presentation/Screens/hompageScreen.dart';

void main() {
  runApp(const ProviderScope(child:MyApp()));
}

final _router=GoRouter(
  initialLocation: '/loading',
  routes:[
    ShellRoute(
        routes:[
        GoRoute(
          path:'/home',
          builder:(context,state)=>Hompagescreen()
      ),
        GoRoute(
            path:'/account',
            builder:(context,state)=>AccountScreen()
        ),
        GoRoute(
            path:'/history',
            builder:(context,state)=>HistoryScreen()
        )
      ],
      builder: (context, state, child){
          return UserScaffold(child:child);
      }
    ),
    ShellRoute(
        routes: [
          GoRoute(
              path: '/adminHome',
            builder: (context, state)=>AdminHomeScreen()
          ),
          GoRoute(
              path: '/bookings',
            builder: (context, state)=>BookingsScreen()
          ),
          GoRoute(
              path: '/cars',
              builder: (context, state)=>CarsScreen()
          ),
          GoRoute(
              path: '/users',
              builder: (context, state)=>UsersScreen()
          )
        ],
         builder:(context, state, child)=>AdminScaffold(child: child)
    ),
    GoRoute(
        path:'/loading',
        builder:(context,state)=>Loadingscreen()
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
    ),
    GoRoute(
        path:'/login',
        builder:(context,state)=>Loginscreen()
    ),
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

class UserScaffold extends StatefulWidget {
  final Widget child;

  const UserScaffold({super.key, required this.child});
  @override
  State<UserScaffold> createState() => _UserScaffoldState();
}

class _UserScaffoldState extends State<UserScaffold>{
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

class AdminScaffold extends StatefulWidget {
  final Widget child;

  const AdminScaffold({super.key, required this.child});
  @override
  State<UserScaffold> createState() => _AdminScaffoldState();
}

class _AdminScaffoldState extends State<UserScaffold>{
  var currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(destinations:
      [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home', ),
        NavigationDestination(icon: Icon(Icons.book_sharp), label: 'Bookings'),
        NavigationDestination(icon: Icon(Icons.supervised_user_circle), label: 'Users'),
        NavigationDestination(icon: Icon(Icons.drive_eta_rounded), label: 'Cars')
      ],
          selectedIndex: currentIndex,
          onDestinationSelected:(int index) {
            if (index == 0) {
              setState(() {
                currentIndex= index;
              });
              context.go('/adminHome');
            }
            else if (index == 1) {
              setState(() {
                currentIndex= index;
              });
              context.go('/bookings');
            }
            else if (index == 2) {
              setState(() {
                currentIndex=index;
              });
              context.go('/users');
            }
            else if (index == 3) {
              setState(() {
                currentIndex=index;
              });
              context.go('/cars');
            }
          }),
    );
  }
}




