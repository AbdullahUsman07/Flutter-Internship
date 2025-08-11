

import 'package:flutter/material.dart';

class MenuComponent extends StatelessWidget {
  MenuComponent({
    super.key,
    this.enableborder = false,
    this.price = 300,
    this.oldprice = 400,
    this.label = 'Deal 1',
    this.imageUrl = 'assets/images/burger.png',
    this.description = 'Zinger and 345ml soft drink',
    this.showAddButton = true,
  });

  bool enableborder;
  final double price;
  final double oldprice;
  final String label;
  final String imageUrl;
  final String? description;
  bool showAddButton;

  double get price_ => price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 120,
      child: Stack(
        children: [
          Container(
            height: 90,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: enableborder
                    ? Color.fromRGBO(255, 79, 0, 1)
                    : Colors.transparent,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 10,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 10,
            child: Text(
              price.toString(),
              style: TextStyle(
                color: Color.fromRGBO(255, 79, 0, 1),
                fontSize: 11,
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 55,
            child: Text(
              oldprice.toString(),
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.lineThrough,
                decorationColor: Color.fromRGBO(255, 79, 0, 1),
                decorationThickness: 2.0,
                fontSize: 11,
              ),
            ),
          ),
          
          showAddButton? Positioned(
            right: 3,
            top: 70,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: Icon(Icons.add, color: Colors.black, size: 15),
            ),
          ): SizedBox(height: 0,width: 0,),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text(
              description ?? '',
              style: TextStyle(color: Colors.white, fontSize: 8),
            ),
          ),
        ],
      ),
    );
  }
}