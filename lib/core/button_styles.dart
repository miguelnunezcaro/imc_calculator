import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';

class ButtonStyles {
  static final ButtonStyle primaryButton = ButtonStyle(
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    backgroundColor: WidgetStateProperty.all(AppColors.accent),
  );
}
