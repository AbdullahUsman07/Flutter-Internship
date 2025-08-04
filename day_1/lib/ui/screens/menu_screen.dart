import 'package:day_1/ui/widgets/bottom_navbar.dart';
import 'package:day_1/ui/widgets/menu_item_card.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  // List of image URLs and item details
  final List<Map<String, dynamic>> menuItems = [
    {
      'imageUrl': 'assets/images/still-life-delicious-american-hamburger.jpg',
      'title': 'Juicy And Savory Steak',
      'subtitle': 'Lorem ipsum dolor sit amet',
      'price': 15.99,
      'rating': 4.5,
    },
    {
      'imageUrl':
          'assets/images/flat-lay-meringue-cake-with-cinnamon-citrus.jpg',
      'title': 'Spicy Chicken Delight',
      'subtitle': 'Lorem ipsum dolor sit amet',
      'price': 12.59,
      'rating': 4.2,
    },
    {
      'imageUrl': 'assets/images/grilled-meat-with-vegetables-wine.jpg',
      'title': 'Fresh Veggie Pasta',
      'subtitle': 'Lorem ipsum dolor sit amet',
      'price': 10.99,
      'rating': 4.7,
    },
    {
      'imageUrl':
          'assets/images/close-up-refreshing-alcoholic-drink-with-grapefruit.jpg',
      'title': 'Grilled Salmon',
      'subtitle': 'Lorem ipsum dolor sit amet',
      'price': 18.50,
      'rating': 4.4,
    },
    {
      'imageUrl': 'assets/images/tasty-breakfast-meal-composition.jpg',
      'title': 'Cheese Pizza',
      'subtitle': 'Lorem ipsum dolor sit amet',
      'price': 11.75,
      'rating': 4.1,
    },
    {
      'imageUrl': 'assets/images/still-life-delicious-american-hamburger.jpg',
      'title': 'Exotic Fruit Salad',
      'subtitle': 'Lorem ipsum dolor sit amet',
      'price': 9.99,
      'rating': 4.6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Add dark background
      bottomNavigationBar: BottomNavBar(selectedIndex: 1,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ), // Reduced padding to allow more grid space
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
                        color: Colors.white.withAlpha(51),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(Icons.search, color: Colors.white),
                    ),
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
                            'assets/images/handsome-man-standing-front-city-building.jpg',
                            height: 42,
                            width: 42,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                // Top Image with Bottom-Centered Text Overlay
                Stack(
                  children: [
                    // Enlarged Image Banner
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          0.45, // increased from 0.35
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/composition-noodles-bowl.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Gradient Overlay
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),

                    // Text Overlay at Bottom Center
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            'Menu Items',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 4,
                                  color: Colors.black54,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Explore our delicious offerings',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                              shadows: const [
                                Shadow(
                                  blurRadius: 4,
                                  color: Colors.black45,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    physics:
                        NeverScrollableScrollPhysics(), // Disable GridView scrolling
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          0.8, // Adjusted for better card proportions
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      return MenuItemCard(
                        key: ValueKey(index),
                        imageUrl: menuItems[index]['imageUrl'],
                        title: menuItems[index]['title'],
                        subtitle: menuItems[index]['subtitle'],
                        price: menuItems[index]['price'],
                        rating: menuItems[index]['rating'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
