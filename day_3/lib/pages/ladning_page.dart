
import 'package:day_3/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(  
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Stack(  
              
              children:[
               Image.asset(
              'assets/images/CHEESE_SANDY_BURGER_1.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0x73E16407),
                  Color(0x737B3704),
                ])
              ),
            ),
              ]
            ),
        
          ),
          Positioned(
            top: 0,
            left:250,
            child: Container(
              width: 117,
              height: 123,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/vectors/Vector_1.png'),
                  fit: BoxFit.cover
                )
              ),
            )),
            Positioned(  
              top: 730,
              left: 26,
              child: Container(  
                width: 72,
                height: 108,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/vectors/Vector_2.png'),
                    fit: BoxFit.cover
                  )
                )
              ), 
            ),
            Positioned(  
              top: 90,
              left: 338,
              child: Container(  
                width: 28,
                height: 37,
                decoration: BoxDecoration(  
                  image: DecorationImage(
                    image: AssetImage('assets/vectors/Vector_3.png'),
                    fit: BoxFit.cover
                  )
                )
              ),
            ),
            Positioned(  
              top: 740,
              left: 82,
              child: Transform.rotate(
                angle: math.pi,
                child: Container(  
                  width: 17,
                  height: 22,
                  decoration: BoxDecoration(  
                    image: DecorationImage(
                      image: AssetImage('assets/vectors/Vector_3.png'),
                      fit: BoxFit.cover
                    )
                  )
                ),
              ),
            ),
            Positioned(  
              top: 370,
              left: 150,
              child: Container(  
                height: 98,
                width: 98,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/shapes/Ellipse_5.png'),
                    fit: BoxFit.cover
                  )
                )
              ),
            ),
            Positioned(
              top: 386,
              left: 161,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroPage()));
                },
                child: Container(
                  height: 66,
                  width: 76,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/shapes/Ellipse_6.png'),
                      fit: BoxFit.cover
                    )
                  )
                ),
              ),
            ),
            Positioned(  
              top: 470,
              left: 120,
              child: SizedBox(  
                height: 41,
                width: 191,
                child: Text('Quick Food', style:TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                )),
              ),
            ),
            Positioned(  
              top: 520,
              left: 74,
              child: SizedBox(  
                height: 41,
                width: 284,
                child: Text('Fast, Fresh, and at Your Doorstep!', style:TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                )),
              ),
            ),
        ],
      )
    );
  }
}