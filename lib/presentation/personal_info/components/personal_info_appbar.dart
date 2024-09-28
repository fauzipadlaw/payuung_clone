import 'package:flutter/material.dart';

class PersonalInfoAppbar extends StatelessWidget {
  const PersonalInfoAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0.0,
      title: const Text(
        'Informasi Pribadi',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
    );
  }
}
