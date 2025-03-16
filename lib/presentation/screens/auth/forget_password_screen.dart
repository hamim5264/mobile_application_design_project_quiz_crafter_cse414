import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/app_colors.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/app_text_styles.dart';
import 'package:mobile_application_design_project_quiz_crafter/presentation/screens/auth/password_reset_screen.dart';
import 'package:mobile_application_design_project_quiz_crafter/presentation/screens/auth/signup_screen.dart';
import 'package:mobile_application_design_project_quiz_crafter/widgets/body_background.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BodyBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Text(
                    "Reset Password",
                    style: AppTextStyles.headlineLarge.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: "Enter Email Address",
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero, minimumSize: Size(0, 0)),
                        onPressed: () {
                          Get.to(() => const SignupScreen());
                        },
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: AppColors.accent,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => PasswordResetScreen());
                      },
                      child: const Text(
                        "NEXT",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
