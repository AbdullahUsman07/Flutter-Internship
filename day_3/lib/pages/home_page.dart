import 'package:day_3/data/menu.dart';
import 'package:day_3/pages/cart_page.dart';
import 'package:day_3/widgets/cuisine_list.dart';
import 'package:day_3/widgets/restaurant_list.dart';
import 'package:day_3/widgets/theme_creator.dart';
import 'package:day_3/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          themeCreator(context),
          Column(
            children: [
              SafeArea(
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 70, 0, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20, width: 20),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Icon(Icons.menu, color: Colors.white, size: 30),
                          SizedBox(width: 220),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                              },
                              child: Image.asset('assets/vectors/heart-icon.png')),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      CustomSearchBar(searchController: _searchController),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListView(
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          const SizedBox(width: 65),
                          SizedBox(
                            height: 200,
                            width: 250,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/images/hamburger.png',
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 68,
                                  left: 32,
                                  child: Text(
                                    'Food & Restaurants',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      backgroundColor: Colors.black.withAlpha(20),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 90,
                                  left: 60,
                                  child: Text(
                                    'Place a favourite meal',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      backgroundColor: Colors.black.withAlpha(30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Text('Cuisines',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 79, 0, 1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CuisineList(cuisineList: cuisineList),
                      const SizedBox(height: 40),
                      CuisineList(cuisineList: cuisineList2),
                      const SizedBox(height: 60),
                      Text('Top Rated Restaurants',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 79, 0, 1),
                        ),
                      ),
                      const SizedBox(height: 20),
                      RestaurantList(),
                      const SizedBox(height: 60),
                      Text('Your Preferred Cuisines',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 79, 0, 1),
                        ),
                      ),
                      const SizedBox(height: 20),
                      RestaurantList(),
                      const SizedBox(height: 60),
                      Text('Quick Delivery',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 79, 0, 1),
                        ),
                      ),
                      const SizedBox(height: 20),
                      RestaurantList(),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

