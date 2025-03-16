import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/app_colors.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/app_text_styles.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/assets_path.dart';
import 'package:mobile_application_design_project_quiz_crafter/widgets/body_background.dart';
import 'package:mobile_application_design_project_quiz_crafter/widgets/center_circular_progress_indicator.dart';
import 'dart:async';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.off(() => LogInScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BodyBackground(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                ),
                Image.asset(
                  AssetsPath.appLogo,
                  width: 180,
                ),
                SizedBox(
                  height: 140,
                ),
                CenterCircularProgressIndicator(),
                SizedBox(
                  height: 16,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Developed By - Team App Architect",
                      style: AppTextStyles.bodySmall,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Version 1.0.1",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
