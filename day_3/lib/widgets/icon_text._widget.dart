

  import 'package:flutter/material.dart';

Row iconAndText(String imagePath, String text) {
    return Row(
                      children: [
                        SizedBox(height: 25, width: 25, child: Image.asset(imagePath),),
                        SizedBox(width: 20,),
                        Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],);
  }
