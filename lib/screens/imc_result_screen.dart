import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/button_styles.dart';
import 'package:imc_calculator/screens/imc_home_screen.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolBarResult(),
      body: bodyResult(context),
    );
  }

  Widget bodyResult(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.primary),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Image.asset("assets/images/cuerpo.webp", height: 300),
                    Text(
                      "Tu IMC es: ${calcIMC(height, weight).toInt()}",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primaryTitle,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    weightCondition(calcIMC(height, weight)),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Padding( 
            padding: const EdgeInsets.only(
              bottom: 55.0,
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
                    MaterialPageRoute(builder: (context) => ImcHomeScreen()),
                  );
                },
                style: ButtonStyles.primaryButton,
                child: Text(
                  "Finalizar",
                  style: TextStyle(color: AppColors.primaryTitle),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar toolBarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.primaryTitle,
    );
  }

  double calcIMC(double height, int weight) {
    double imc = weight / ((height / 100) * (height / 100));
    return imc;
  }

  Widget weightCondition(double imc) {
    if (imc < 18.5) {
      return Text("Bajo de peso", style: TextStyle(color: Colors.grey));
    } else if (imc > 18.5 && imc < 24.9) {
      return Text(
        "Peso normal",
        style: TextStyle(color: const Color.fromARGB(255, 13, 169, 54)),
      );
    } else if (imc > 25 && imc < 29.9) {
      return Text(
        "Sobrepeso",
        style: TextStyle(color: const Color.fromARGB(255, 201, 198, 6)),
      );
    } else if (imc > 30 && imc < 34.9) {
      return Text(
        "Obesidad ligera",
        style: TextStyle(color: const Color.fromARGB(255, 235, 117, 117)),
      );
    } else if (imc > 35 && imc < 39.9) {
      return Text(
        "Obesidad",
        style: TextStyle(color: const Color.fromARGB(255, 231, 48, 48)),
      );
    } else {
      return Text(
        "Obesidad mórbida",
        style: TextStyle(color: const Color.fromARGB(255, 208, 21, 8)),
      );
    }
  }
}
