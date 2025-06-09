import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cardetailscreen extends StatelessWidget {
  const Cardetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>{}, icon: Icon(Icons.arrow_back)),
        title: Text("Car Details"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Basic information"),
            Card(
              child: Column(
                children: [
                  Row(
                    children: [],
                  ),
                  Row(
                    children: [],
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
            SizedBox(height:10),
            Card(
              child: Column(
                children: [
                  Text("Specifications"),
                  Row(
                    children: [],
                  ),
                  Row(
                    children: [],
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
            TextButton(onPressed: () {  },style: TextButton.styleFrom(backgroundColor: Colors.red), child: Text("Delete Car"),),
            SizedBox(height:20),
            TextButton(onPressed: () {  }, child: Text("Edit Car"),)
          ],
        ),
      ),
    );
  }
}
