import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
    color: AppColors.background,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    color: Colors.black,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    color: Colors.black,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins', // ✅ Poppins for buttons
    color: Colors.white,
  );
}
