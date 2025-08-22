import 'package:flutter/material.dart';
import 'package:imc_calculator/screens/imc_home_screen.dart';
import 'core/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: ImcHomeScreen(),
      ),
    );
  }
}
