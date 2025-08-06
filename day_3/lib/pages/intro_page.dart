import 'package:day_3/pages/login_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 1),
                  Color.fromRGBO(25, 23, 23, 1),
                  Color.fromRGBO(43, 40, 39, 1),
                  Color.fromRGBO(48, 45, 44, 1),
                ],
                stops: [0.0, 0.3, 0.65, 1.0],
              ),
            ),
          ),
          Positioned(
            top: 64,
            left: 150,
            child: SizedBox(
              width: 89,
              height: 82,
              child: Image.asset('assets/shapes/Ellipse_7.png'),
            ),
          ),
          Positioned(
            top: 89,
            left:163,
            child: Text(
              'icon',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'RiotBrush',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: 195,
            left: 70,
            child: SizedBox(
              width: 260,
              height: 180,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Quick',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255,79,0,1),
                      letterSpacing: 17,
                      fontFamily: 'RiotBrush',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Food',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: 17,
                      fontFamily: 'RiotBrush',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(  
            top: 327,
            left: 87,
            child: Container(  
              width: 220,
              height: 270,
              decoration: BoxDecoration(  
                image: DecorationImage(
                  image: AssetImage('assets/images/cheeze_pizza.png'),
                  fit: BoxFit.cover
                )
              )
            ),
          ),
          Positioned(
            top:590,
            left:46,
            child: SizedBox(
              width: 300,
              height: 247,
              child: Column(
                children: [
                  SizedBox(  
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6600),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                       child: Text('Login',
                       style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                       ),
                       )),
                  ),
                  const SizedBox(height: 5,),
                  Text('OR login with', style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
                  const SizedBox(height: 15,),
                  Row(   
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/facebook_logo.png', width: 50, height: 50),
                      Image.asset('assets/images/google_logo.png', width: 50, height: 50),
                      Image.asset('assets/images/X_logo.png', width: 50, height: 50),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Text('Don\'t have an account?', 
                  style: TextStyle(  
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
                  TextButton(
                    onPressed: () {
                      // Navigate to sign up page
                    },
                    child: Text(
                      'Register Now!',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 79, 0, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),),
            
        ],
      ),
    );
  }
}
