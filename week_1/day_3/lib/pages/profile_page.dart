import 'package:day_3/widgets/theme_creator.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height, // Give Stack a defined height
          child: Stack(
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
              top: 32,
              left: 100,
              child: Text(
                'Profile',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            Positioned(
              top: 150,
              left: 25,
              child: profileComponent('Email', 'abcd@gmail.com'),
            ),
            Positioned(
              top: 320,
              left: 25,
              child: profileComponent('Mobile Number', '9748-498489')),
              Positioned(
                bottom: 340,
                left: 1,
                right: 1,
                child: Divider(thickness: 1, color: Colors.white)),
                Positioned(
                  bottom: 300,
                  left: 30,
                  child: Text('Connected accounts', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))),
               Positioned(
                bottom: 170,
                left: 25,
                child: profileComponent2('Facebook', 'Connected', 'assets/images/facebook_logo.png'),),
               Positioned(
                bottom: 60,
                left: 25,
                child: profileComponent2('Google', 'Connected', 'assets/images/google_logo.png'),),
          ],
        ), // Close Stack
      ), // Close SizedBox
      ), // Close SingleChildScrollView
    ); // Close Scaffold
  }

  Container profileComponent(String name, String detail) {
    return Container(
            width: 330,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Color.fromRGBO(255, 79, 0, 1),
                width: 0.8,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left:30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: TextStyle(color: Colors.white,fontSize: 14)),
                      Text(
                        detail,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            ' Verified',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 28,
                  right: 20,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined,color: Color.fromRGBO(255, 79, 0, 1), size: 32,)),),
                
              ],
            ),
          );
  }

  Container profileComponent2(String name, String detail, String imageUrl) {
    return Container(
            width: 330,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Color.fromRGBO(255, 79, 0, 1),
                width: 0.8,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left:60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: TextStyle(color: Colors.white)),
                      Text(
                        detail,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
               Positioned(
                top:27,
                left: 20,
                child: SizedBox(height: 25,width: 25, child: Image.asset(imageUrl),),)
              ],
            ),
          );
  }

}


