import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final bool isSelected;
  final Function(int) onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.yellow : Colors.black,
            size: 30,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.yellow : Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
