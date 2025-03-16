import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/app_colors.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/app_text_styles.dart';
import 'package:mobile_application_design_project_quiz_crafter/presentation/screens/auth/set_password_screen.dart';
import 'package:mobile_application_design_project_quiz_crafter/widgets/body_background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();

  bool isError = false;
  late Timer _timer = Timer(Duration.zero, () {});
  int _secondsRemaining = 120;
  bool _isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isResendEnabled = true;
          _timer.cancel();
        });
      }
    });
  }

  void _resendCode() async {
    _secondsRemaining = 120;
    _isResendEnabled = false;
    _startCountdown();
  }

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Text("Verify OTP",
                      style: AppTextStyles.headlineLarge.copyWith(
                        color: Colors.black,
                      )),
                  Text(
                    "A 4 digit code has been sent to your email",
                    style: AppTextStyles.headlineLarge.copyWith(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 24),
                  PinCodeTextField(
                    controller: _pinTEController,
                    appContext: context,
                    length: 4,
                    obscureText: true,
                    animationType: AnimationType.fade,
                    backgroundColor: Colors.transparent,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldWidth: 40,
                      fieldHeight: 50,
                      activeFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      selectedFillColor: Colors.transparent,
                      activeColor: isError ? Colors.red : AppColors.primary,
                      inactiveColor:
                          Get.isDarkMode ? Colors.grey : Colors.grey.shade400,
                      selectedColor: isError ? Colors.red : AppColors.accent,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: false,
                    textStyle: TextStyle(
                      color: isError ? Colors.red : AppColors.accent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    onCompleted: (v) {
                      setState(
                        () {
                          if (v == "0000") {
                            isError = false;
                          } else {
                            isError = true;
                          }
                        },
                      );
                    },
                    onChanged: (value) {
                      setState(
                        () {
                          isError = false;
                        },
                      );
                    },
                    beforeTextPaste: (text) => true,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const SetPasswordScreen());
                      },
                      child: const Text(
                        "VERIFY",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: "This code will expire in ",
                        ),
                        TextSpan(
                          text: "$_secondsRemaining s",
                          style: TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: _isResendEnabled ? _resendCode : null,
                    child: Text(
                      "Resend Code",
                      style: TextStyle(
                        color:
                            _isResendEnabled ? AppColors.accent : Colors.grey,
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

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
