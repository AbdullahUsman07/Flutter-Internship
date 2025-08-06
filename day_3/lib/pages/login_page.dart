import 'package:day_3/widgets/custom_form_feild.dart';
import 'package:day_3/widgets/icon_elipse.dart';
import 'package:day_3/widgets/navigate_button.dart';
import 'package:day_3/widgets/theme_creator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          themeCreator(),
          iconElipse(),
          Positioned(
            top: 180,
            left: 40,
            child: SizedBox(
              width: 320,
              height: 290,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 290,
                      width: 200,
                      child: Image.asset('assets/images/chicken_bucket.png'),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 180,
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset('assets/images/chicken_piece.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 62,
            child: SizedBox(
              width: 286,
              height: 63,
              child: Column(
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 79, 0, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Login to your account to continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 530,
            left: 40,
            child: SizedBox(
              width: 320,
              height: 60,
              child: CustomFormFeild(
                title: 'Email',
                controller: _emailController,
              ),
            ),
          ),
          Positioned(
            top: 620,
            left: 40,
            child: SizedBox(
              width: 320,
              height: 60,
              child: CustomFormFeild(
                title: 'Password',
                controller: _passwordController,
                isPass: true,
              ),
            ),
          ),
          Positioned(
            top: 680,
            left: 65,
            child: Text(
              'Forgot Password',
              style: TextStyle(
                color: Color.fromRGBO(255, 79, 0, 1),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Positioned(
            top: 730,
            left: 50,
            child: NavigateButton(title: 'Login', onPressed: () {}),
          ),
          Positioned(
            top: 785,
            left: 100,
            child: Text.rich(  
              TextSpan(
                text: 'New here?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: 'Create an account',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 79, 0, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle registration navigation
                      },
                  ),
                ],
              ),
            ))
        ],
      ),
    );
  }
}
