
import 'package:flutter/material.dart';

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
                  borderRadius: BorderRadius.circular(11), 
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
