import 'package:day_3/pages/login_page.dart';
import 'package:day_3/widgets/custom_form_feild.dart';
import 'package:day_3/widgets/navigate_button.dart';
import 'package:day_3/widgets/theme_creator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reenterPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _favCusineController = TextEditingController();
  final _allergyController = TextEditingController();
  final _prefRestaurantController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              themeCreator(context),
              Positioned(
                top: 27,
                left: 150,
                child: SizedBox(
                  width: 100,
                  height: 95,
                  child: Image.asset('assets/images/profile.png'),
                ),
              ),
              Positioned(
                top: 90,
                left: 230,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset('assets/shapes/Ellipse_9.png'),
                ),
              ),
              Positioned(
                top: 100,
                left: 240,
                child: SizedBox(
                  width: 10,
                  height: 10,
                  child: Image.asset('assets/vectors/Arrow.png'),
                ),
              ),
              Positioned(
                top: 136,
                left: 43,
                child: Text(
                  'Register Your Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 79, 0, 1),
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 33,
                child: Text(
                  'Register account to start your journey with Quick Food',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 220,
                left: 40,
                child: CustomFormFeild(
                  title: 'Name',
                  controller: _nameController,
                ),
              ),
              Positioned(
                top: 280,
                left: 40,
                child: CustomFormFeild(
                  title: 'Email',
                  controller: _emailController,
                ),
              ),
              Positioned(
                top: 340,
                left: 40,
                child: CustomFormFeild(
                  title: 'Phone No.',
                  controller: _phoneNumberController,
                ),
              ),
              Positioned(
                top: 400,
                left: 40,
                child: CustomFormFeild(
                  title: 'Password',
                  controller: _passwordController,
                  isPass: true,
                ),
              ),
              Positioned(
                top: 460,
                left: 40,
                child: CustomFormFeild(
                  title: 'Re-enter Password',
                  controller: _reenterPasswordController,
                  isPass: true,
                ),
              ),
              Positioned(
                top: 520,
                left: 40,
                child: CustomFormFeild(
                  title: 'Favourite Cuisine',
                  controller: _favCusineController,
                ),
              ),
              Positioned(
                top: 580,
                left: 40,
                child: CustomFormFeild(
                  title: 'Preferred Restaurant',
                  controller: _prefRestaurantController,
                ),
              ),
              Positioned(
                top: 640,
                left: 40,
                child: CustomFormFeild(
                  title: 'Allergy Information',
                  controller: _allergyController,
                ),
              ),
              Positioned(
                top: 710,
                left: 50,
                child: NavigateButton(
                  title: 'Create Account',
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 765,
                left: 100,
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 79, 0, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 795,
                left: 97,
                child: Text.rich(
                  TextSpan(
                    text: 'Need Help?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: '  Contact Support',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 79, 0, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 190,
                child: SizedBox(
                  width: 123,
                  height: 16,
                  child: Image.asset('assets/vectors/Line_1.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
