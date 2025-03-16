import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/app_colors.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/app_text_styles.dart';
import 'package:mobile_application_design_project_quiz_crafter/presentation/screens/auth/login_screen.dart';
import 'package:mobile_application_design_project_quiz_crafter/widgets/body_background.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                  Text("Set Password",
                      style: AppTextStyles.headlineLarge.copyWith(
                        color: Colors.black,
                      )),
                  Text("Password should be 8 digit with letters and numbers",
                      style: AppTextStyles.headlineLarge.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                      )),
                  const SizedBox(height: 24),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const LogInScreen());
                      },
                      child: const Text("COMPLETE"),
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
