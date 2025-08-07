

import 'package:flutter/material.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190,
                width: 255,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(255, 79, 0, 1), width: 1),
                ),
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/burger.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  Text(
                    'Master Biryani.....',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Icon(Icons.star, color: Color.fromRGBO(255, 79, 0, 1), size: 18),
                  Text('4.8', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
                  Text('(1000+)', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w200),),
                ],
              ),
              Text('PKR 249 minimum .Biryani', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w200),),
              Row(children: [
                Icon(Icons.access_time_outlined, color: Colors.white, size: 16),
                const SizedBox(width: 5),
                Text('5-25 min', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w200),),
                const SizedBox(width: 20),
                Icon(Icons.delivery_dining_rounded, color: Color.fromRGBO(255, 79, 0, 1), size: 20),
                const SizedBox(width: 5),
                Text('Free Delivery', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w200),),
              ],)
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10); 
        },
        itemCount: 5,
      ),
    );
  }
}
