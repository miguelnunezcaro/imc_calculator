import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  bool? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //hombre
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = true;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 16,
                right: 8,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == true
                      ? AppColors.primary
                      : AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/male.png",
                        height: 100,
                        color: selectedGender == true
                            ? AppColors.accent
                            : Colors.black,
                      ),
                      SizedBox(height: 8),
                      Text("Hombre".toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //mujer
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              top: 16,
              bottom: 16,
              right: 16,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: selectedGender == false
                    ? AppColors.primary
                    : AppColors.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primary),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/female.png",
                        height: 100,
                        color: selectedGender == false
                            ? AppColors.accent
                            : Colors.black,
                      ),
                      SizedBox(height: 8),
                      Text("Mujer".toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
