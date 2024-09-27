import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GridIcon extends StatelessWidget {
  final String iconName;
  final String label;
  const GridIcon({
    super.key,
    required this.iconName,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/icons/$iconName.svg',
          height: 40,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
