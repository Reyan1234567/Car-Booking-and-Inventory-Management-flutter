import 'package:flutter/material.dart';

TextField customTextField(controller, keyboardType, label, obsecureText, hint){
  return TextField(
    style: TextStyle(fontFamily:'InterBold'),
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obsecureText,
    decoration: InputDecoration(
        labelText: label,
        hintText:hint,
        hintStyle: TextStyle(color: Color(0xFF9D9D9D)),
        labelStyle: TextStyle(fontFamily: 'InterBold', color: Color(0xFF9D9D9D)),
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:BorderSide(
              color:Color(0xFFC3C3C3),
              width:1
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color:Color(0xFFC3C3C3),
              width:1.0
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color:Colors.orange.shade600,
              width:2.0
          )
        )
        ),
      );
}
