import 'package:day_3/widgets/restaurant_list.dart';
import 'package:day_3/widgets/theme_creator.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                'Favourites',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            Positioned(
              top: 100,
              left: 40,
              child: CustomButton(onPressed: () {}, title: 'Restaurants'),
            ),
            Positioned(
              top: 100,
              left: 220,
              child: CustomButton(onPressed: () {}, title: 'Cuisines'),
            ),
            Positioned(
              top: 170,
              left: 25,
              child: Text(
                'Favourite Restaurants',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 79, 0, 1),
                ),
              ),
            ),
            Positioned(
              top: 205,
              left: 25,
              right: 5, // Add right constraint
              child: RestaurantList(),
            ),
            Positioned(
              top: 520,
              left: 25,
              child: Text(
                'Your Preferred Cuisines',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 79, 0, 1),
                ),
              ),
            ),
            Positioned(
              top: 555,
              left: 25,
              right: 5, // Add right constraint
              child: RestaurantList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title});

  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(255, 70, 0, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }
}
