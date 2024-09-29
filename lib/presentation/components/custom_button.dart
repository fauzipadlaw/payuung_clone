import 'package:flutter/material.dart';

import '../../utils/colors.dart';

enum ButtonType { primary, seconday }

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final ButtonType type;
  final double width;
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.type = ButtonType.primary,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                type == ButtonType.primary ? AppColors.yellow : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: AppColors.yellow,
                )),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
              color:
                  type == ButtonType.primary ? Colors.white : AppColors.yellow,
            ),
          )),
    );
  }
}
