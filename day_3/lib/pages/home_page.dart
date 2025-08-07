import 'package:day_3/data/menu.dart';
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
                            child: Image.asset('assets/vectors/heart-icon.png'),
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

class CuisineList extends StatelessWidget {
  const CuisineList({
    super.key,
    required this.cuisineList
  });

  final List<Map<String,String>> cuisineList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 190,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color.fromRGBO(255, 79, 0, 1), width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11), // Slightly smaller radius to account for border
                  child: Image.asset(
                    cuisineList[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                cuisineList[index]['name']!,
                style: TextStyle(
                  color: Color.fromRGBO(255,79,0,1),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10); 
        },
        itemCount: cuisineList.length,
      ),
    );
  }
}
