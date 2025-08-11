import 'package:day_3/widgets/search_bar.dart';
import 'package:day_3/widgets/theme_creator.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          themeCreator(context),
          Positioned(
            top: 40,
            left: 17,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_sharp, color: Colors.white, size: 20),
            ),
          ),
          Positioned(
            top: 43,
            left: 57,
            child: CustomSearchBar(
              searchController: _searchController,
              color: Color.fromRGBO(255, 70, 0, 1),
            ),
          ),
          Positioned(
            top: 150,
            left: 50,
            child: SizedBox(
              height: 200,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Searches',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  RecentSearch(title: 'Pizza'),
                  const SizedBox(height: 5),
                  RecentSearch(title: 'Double Cheese'),
                  const SizedBox(height: 5),
                  RecentSearch(title: 'Master Biryani'),
                ],
              ),
            ),
          ),
          Positioned(
            top: 370,
            left: 53,
            child: Container(
              height: 170,
              width: 320,
              //color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top Restaurants Searches',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      topRestaurantName(name: 'Pizza'),
                      const SizedBox(width: 15,),
                      topRestaurantName(name: '7up'),
                      const SizedBox(width: 15,),
                      topRestaurantName(name: 'KFC'),
                      const SizedBox(width: 15,),
                      topRestaurantName(name: 'Ice Cream'),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      topRestaurantName(name: 'Biryani'),
                      const SizedBox(width: 15,),
                      topRestaurantName(name: 'McDonalds'),
                      const SizedBox(width: 15,),
                      topRestaurantName(name: 'Dominos'),
                      const SizedBox(width: 15,),
                      topRestaurantName(name: 'Pulao'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container topRestaurantName({String? name}) {
    return Container(   
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Color.fromRGBO(255, 79, 0, 1), width: 1.2),
                        color: Colors.transparent
                      ),
                      child: Text(name ?? '', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300)),
                    );
  }
}

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time_outlined, color: Color.fromRGBO(255, 79, 0, 1)),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Icon(Icons.close, color: Colors.white, size: 16),
      ],
    );
  }
}
