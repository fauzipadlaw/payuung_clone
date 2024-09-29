import 'package:flutter/material.dart';
import 'package:payuung_clone/utils/colors.dart';

class CircleStep extends StatelessWidget {
  final bool isActive;
  final String step;
  final String label;
  final void Function() onTap;
  const CircleStep({
    super.key,
    required this.isActive,
    required this.step,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: isActive ? AppColors.yellow : AppColors.yellowLight,
              borderRadius: BorderRadius.circular(100),
            ),
            alignment: Alignment.center,
            child: Text(
              step,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.yellow,
            ),
          ),
        )
      ],
    );
  }
}
