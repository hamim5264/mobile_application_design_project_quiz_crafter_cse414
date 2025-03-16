import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/app_colors.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/app_text_styles.dart';
import 'package:mobile_application_design_project_quiz_crafter/presentation/screens/auth/forget_password_screen.dart';
import 'package:mobile_application_design_project_quiz_crafter/presentation/screens/auth/signup_screen.dart';
import 'package:mobile_application_design_project_quiz_crafter/widgets/body_background.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
                  Text("Welcome To",
                      style: AppTextStyles.headlineLarge.copyWith(
                        color: Colors.black,
                      )),
                  Text("QuizCrafter",
                      style: AppTextStyles.headlineLarge.copyWith(
                        color: Colors.black,
                      )),
                  const SizedBox(height: 24),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: "Email Address",
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 0)),
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
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero, minimumSize: Size(0, 0)),
                        onPressed: () {
                          Get.to(() => const ForgetPasswordScreen());
                        },
                        child: Text(
                          "Forget Password",
                          style: TextStyle(
                            color: Colors.black54,
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
                      onPressed: () {},
                      child: const Text("LOGIN"),
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
