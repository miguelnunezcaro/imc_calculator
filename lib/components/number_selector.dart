import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final Function() onIncrement;
  final Function() onDecrement;
  final int value;

  const NumberSelector({
    super.key,
    required this.title,
    required this.onIncrement,
    required this.value,
    required this.onDecrement,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(widget.title, style: TextStyles.bodyText),
              Text("${widget.value}", style: TextStyles.bodyText),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      widget.onIncrement();
                    },
                    shape: CircleBorder(),
                    backgroundColor: AppColors.accent,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  SizedBox(width: 10),

                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      widget.onDecrement();
                    },
                    shape: CircleBorder(),
                    backgroundColor: AppColors.accent,
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
