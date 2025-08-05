import 'package:day_1/ui/widgets/bottom_navbar.dart';
import 'package:day_1/ui/widgets/meal_category_row.dart';
import 'package:day_1/ui/widgets/popular_card.dart';
import 'package:day_1/ui/widgets/promo_card.dart';
import 'package:day_1/ui/widgets/see_more_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(selectedIndex: 0,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(  
                        color: Colors.white.withAlpha(51), // 20% transparent white
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(Icons.search, color: Colors.white)),
                    Row(
                      children: [
                        Text(
                          'Hello, User!',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(width: 12.0),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/handsome-man-standing-front-city-building.jpg', // Replace with actual image
                            height: 42,
                            width: 42,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                PromoCard(),
                const SizedBox(height: 40.0),
                MealCategoryRow(),
                const SizedBox(height: 40.0),
                PopularCardList(),
                const SizedBox(height: 10.0),
                SeeMoreButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
