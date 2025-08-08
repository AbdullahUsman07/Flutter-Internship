import 'package:day_3/pages/home_page.dart';
import 'package:day_3/widgets/theme_creator.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          themeCreator(context),
          Positioned(
            top: 30,
            right: 20,
            left: 20,
            child: Image.asset(
              'assets/vectors/rectangle.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20,
            left: 30,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_sharp, color: Colors.white, size: 25),
            ),
          ),
          Positioned(
            top: 32,
            left: 100,
            child: Text(
              'Your Cart',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Positioned(
            top: 400,
            left: 40,
            child: SizedBox(
              width: 300,
              height: 250,   
              child: Column(
                children: [
                  Text(
                    'Empty Cart!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(255, 79, 0, 1),
                    ),
                  ),
                  Text(
                    'Wanna add something?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(255, 79, 0, 1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 79, 0, 1),
                    ),
                    child: Text(
                      'Browse',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
