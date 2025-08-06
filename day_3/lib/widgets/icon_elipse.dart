

import 'package:flutter/material.dart';

Widget iconElipse() {
  return Stack(
    children: [
      Positioned(
        top: 64,
        left: 150,
        child: SizedBox(
          width: 89,
          height: 82,
          child: Image.asset('assets/shapes/Ellipse_7.png'),
        ),
      ),
      Positioned(
        top: 89,
        left: 163,
        child: Text(
          'icon',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'RiotBrush',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  );
}