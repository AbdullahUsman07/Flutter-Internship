import 'package:day_3/widgets/menu_component.dart';
import 'package:day_3/widgets/theme_creator.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
            top: 26,
            right: 80,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_sharp,
                color: Color.fromRGBO(255, 79, 0, 1),
              ),
            ),
          ),
          Positioned(
            top: 26,
            right: 40,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_sharp,
                color: Color.fromRGBO(255, 79, 0, 1),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 50,
            child: itemImage('assets/images/burger.png'),
          ),
          Positioned(
            top: 135,
            left: 180,
            child: Text(
              'Master Biryani',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(top: 200, left: 55, child: distanceWidget()),
          Positioned(top: 260, left: 66, child: ratingWidget()),
          Positioned(
            top: 300,
            left: 5,
            right: 5,
            child: Divider(color: Colors.white, thickness: 1),
          ),
          Positioned(
            top: 350,
            left: 5,
            right: 5,
            child: Divider(color: Colors.white, thickness: 1),
          ),
          Positioned(
            top: 288,
            left: 180,
            child: Text(
              '|',
              style: TextStyle(
                color: Colors.white,
                fontSize: 59,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Positioned(
            top: 324,
            left: 70,
            child: Text(
              'Popular',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 324,
            left: 240,
            child: Text(
              'Midnight Deals',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 370,
            left: 15,
            child: Text(
              'Most Ordered',
              style: TextStyle(
                color: Color.fromRGBO(255, 79, 0, 1),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          Positioned(
            top: 420,
            left: 15,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MenuComponent(),
                  const SizedBox(width: 10),
                  MenuComponent(),
                  const SizedBox(width: 10),
                  MenuComponent(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 590,
            left: 15,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MenuComponent(description: '',),
                  const SizedBox(width: 10),
                  MenuComponent(description: '',),
                  const SizedBox(width: 10),
                  MenuComponent(description: '',),
                ],
              ),
            ),
          ),
          Positioned(
            top: 420,
            left: 15,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MenuComponent(),
                  const SizedBox(width: 10),
                  MenuComponent(),
                  const SizedBox(width: 10),
                  MenuComponent(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row distanceWidget() {
    return Row(
      children: [
        Text(
          '4 Km',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        ),
        Text('  |', style: TextStyle(color: Color.fromRGBO(255, 79, 0, 1))),
        Text(
          '  Free Delivery',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Row ratingWidget() {
    return Row(
      children: [
        Icon(
          Icons.star_border_sharp,
          size: 12,
          color: Color.fromRGBO(255, 79, 0, 1),
        ),
        Text(
          '  4.7',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          '  1000+ ratings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        ),
        const SizedBox(width: 80),
        Text(
          'See reviews',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}


Widget itemImage(String imageUrl) {
  return Container(
    height: 90,
    width: 110,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Color.fromRGBO(255, 79, 0, 1), width: 1),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.asset(imageUrl, fit: BoxFit.cover),
    ),
  );
}
