import 'package:flutter/material.dart';

TextButton customTextButton(onPressed, text){
  return TextButton(onPressed:onPressed,
      style: TextButton.styleFrom(
          backgroundColor: Color(0xFFEA6307),
          foregroundColor: Colors.white,
          padding:EdgeInsets.symmetric(horizontal:20, vertical: 15),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
      ),
      child: Text(text, style: TextStyle(fontFamily: 'InterBold'),));
}
