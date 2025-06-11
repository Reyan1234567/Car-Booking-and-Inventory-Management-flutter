import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customDropDown(List<String> list, ValueChanged callback, String selected) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Color(0xFFC3C3C3), width: 1.0),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selected,
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down, color: Color(0xFF7B4BBA)),
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
              ),
            ),
          );
        }).toList(),
        onChanged: callback,
        dropdownColor: Colors.white,
        elevation: 2,
      ),
    ),
  );
}