import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/button_styles.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 70;
  double selectedHeight = 150;
  bool? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.primaryTitle,
        title: Text("Calculadora de IMC"),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            GenderSelector(),
            SizedBox(height: 15),
            HeightSelector(
              selectedHeight: selectedHeight,
              setHeight: (double value) {
                setState(() {
                  selectedHeight = value;
                });
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: NumberSelector(
                    title: "Peso",
                    value: selectedWeight,
                    onIncrement: () {
                      setState(() {
                        selectedWeight++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        selectedWeight--;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: NumberSelector(
                    title: "Edad",
                    value: selectedAge,
                    onIncrement: () {
                      setState(() {
                        selectedAge++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        selectedAge--;
                      });
                    },
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30.0,
                left: 10,
                right: 10,
                top: 10,
              ),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImcResultScreen(
                          height: selectedHeight,
                          weight: selectedWeight,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyles.primaryButton,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: AppColors.primaryTitle),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
