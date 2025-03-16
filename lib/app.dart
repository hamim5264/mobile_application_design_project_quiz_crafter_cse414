import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/utilities/app_themes.dart';
import 'presentation/screens/auth/splash_screen.dart';

class QuizCrafterApp extends StatelessWidget {
  const QuizCrafterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QuizCrafter',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
