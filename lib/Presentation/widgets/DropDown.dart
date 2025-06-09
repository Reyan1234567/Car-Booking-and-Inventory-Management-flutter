import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customDropDown(List<String> list, ValueChanged callback, String selected){
  return DropdownButton(value:selected,items: list.map((lis){return DropdownMenuItem(value: lis, child: Text(lis));}).toList() , onChanged: callback,icon:Icon(Icons.arrow_downward));
}