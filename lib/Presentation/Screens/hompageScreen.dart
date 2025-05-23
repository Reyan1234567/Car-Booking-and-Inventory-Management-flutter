import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpolo/Presentation/widgets/bottomNavbar.dart';

class Hompagescreen extends StatefulWidget {
  const Hompagescreen({super.key});

  @override
  State<Hompagescreen> createState() => _HompagescreenState();
}

class _HompagescreenState extends State<Hompagescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
    );
  }
}
