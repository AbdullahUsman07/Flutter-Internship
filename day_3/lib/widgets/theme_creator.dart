

import 'package:flutter/material.dart';

Widget themeCreator() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(0, 0, 0, 1),
          Color.fromRGBO(25, 23, 23, 1),
          Color.fromRGBO(43, 40, 39, 1),
          Color.fromRGBO(48, 45, 44, 1),
        ],
        stops: [0.0, 0.3, 0.65, 1.0],
      ),
    ),
  );
}
