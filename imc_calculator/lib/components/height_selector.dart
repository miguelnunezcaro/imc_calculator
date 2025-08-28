import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double value) setHeight;

  const HeightSelector({
    super.key,
    required this.selectedHeight,
    required this.setHeight,
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 15,
              bottom: 8,
              right: 15,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.primary),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text("ALTURA", style: TextStyles.bodyText),
                  Text(
                    "${widget.selectedHeight.toInt()} cm",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Slider(
                    value: widget.selectedHeight,
                    min: 65,
                    max: 260,
                    divisions: 195,
                    thumbColor: AppColors.accent,
                    activeColor: AppColors.accent,
                    label: "${widget.selectedHeight.toInt()}",
                    onChanged: (double newHeight) {
                      setState(() {
                        widget.setHeight(newHeight);
                      });
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
