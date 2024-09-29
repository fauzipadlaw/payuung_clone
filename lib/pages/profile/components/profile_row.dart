import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  final Widget? icon;
  final String label;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final void Function()? onTap;
  const ProfileRow({
    super.key,
    this.icon,
    required this.label,
    this.onTap,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            if (icon != null)
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: icon,
              ),
            if (icon != null)
              const SizedBox(
                width: 20,
              ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
