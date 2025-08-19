
import 'package:day_11/screens/login_screen.dart';
import 'package:day_11/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppColors.textDark, size: 24),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.heading.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.015,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // balances the back button space
                  ],
                ),
              ),

              // username field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomTextFeild(title: "Username"),
              ),

              // Email field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomTextFeild(title: "Email"),
              ),

              // Password field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomTextFeild(title: "Password"),
              ),

              // Google button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFF0F3F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: BorderSide.none,
                    ),
                    onPressed: () {

                    },
                    child: Text(
                      "Continue with Google",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                ),
              ),

              // Sign Up button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Signup logic
                    },
                    child: Text(
                      "Sign Up",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Bottom text
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              child: Text(
                "Already have an account? Sign In",
                textAlign: TextAlign.center,
                style: AppTextStyles.body.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xFF637C88),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

