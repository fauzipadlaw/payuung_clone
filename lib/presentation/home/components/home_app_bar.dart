import 'package:flutter/material.dart';
import 'package:payuung_clone/utils/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: AppColors.yellow,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      leading: Container(
        margin: const EdgeInsets.only(left: 20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat malam',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Muhammad',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      leadingWidth: size.width * 0.3,
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Stack(
            children: [
              const SizedBox(
                height: 45,
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 8),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Text(
            'M',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
