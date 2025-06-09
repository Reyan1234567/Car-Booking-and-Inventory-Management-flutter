import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget NumberStepper(controller, void Function() decrease, void Function() increase){
  return TextField(
    readOnly: true,
    decoration:InputDecoration(
      suffixIcon: Row(
        children: [
          IconButton(onPressed: increase, icon: Icon(Icons.keyboard_arrow_up_outlined)),
          IconButton(onPressed: decrease, icon: Icon(Icons.keyboard_arrow_down_outlined))
        ],
      )
    ),
  );
}