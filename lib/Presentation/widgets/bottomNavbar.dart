import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({super.key});

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  int currentPageIndex=0;
  String Selected='';
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: currentPageIndex,
        backgroundColor:Color(0xffe96307),
        animationDuration: Duration(milliseconds: 500),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            if(index==0){
              context.go('/');
            }
            else if(index==1){
              context.go('/history');
            }
            else if(index==2){
              context.go('/account');
            }
          });
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home', ),
          NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          NavigationDestination(icon: Icon(Icons.bookmark_border), label: 'Account',
          )]);
  }
}
