import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpolo/Presentation/widgets/TextButton.dart';
import 'package:flutterpolo/Presentation/widgets/bottomNavbar.dart';
import 'package:go_router/go_router.dart';

class Hompagescreen extends StatefulWidget {
  const Hompagescreen({super.key});

  @override
  State<Hompagescreen> createState() => _HompagescreenState();
}

class _HompagescreenState extends State<Hompagescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/polo.png'),
            Row(
              children: [
                Text("Same destination"),
                Text("Different destination")
              ],
            ),
            Container(
              width: double.infinity,
              child: Card(
                child:
                Column(
                  children: [
                    Text("data"),
                    Text("data")
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Card(
                child:
                Column(
                  children: [
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                  ],
                ),
              ),
            ),
            customTextButton(()=>{}, "Search")
          ],
        ),
      )
    );
  }
}
