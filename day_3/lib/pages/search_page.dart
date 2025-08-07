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
              icon: Icon(Icons.arrow_back_sharp,color: Colors.white, size: 20), ),
          ),
          Positioned(
            top: 43,
            left: 57,
            child: CustomSearchBar(searchController: _searchController, color: Color.fromRGBO(255, 70, 0, 1),),
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
                  Text('Recent Searches', style: TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(height: 10),
                  RecentSearch(title: 'Pizza'),
                  const SizedBox(height: 5),
                  RecentSearch(title: 'Double Cheese'),
                  const SizedBox(height: 5),
                  RecentSearch(title: 'Master Biryani'),

                ],
              ),
            ))
        ],
      ),
    );
  }
}

class RecentSearch extends StatelessWidget {
  const RecentSearch({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.access_time_outlined, color: Color.fromRGBO(255, 79, 0, 1)),
      SizedBox(width: 8),
      Expanded(
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      Icon(Icons.close, color: Colors.white, size: 16),
    ],);
  }
}
