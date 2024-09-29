import 'package:flutter/material.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_field.dart';
import 'package:payuung_clone/utils/colors.dart';

class KtpField extends StatelessWidget {
  const KtpField({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8.0,
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.yellowLight,
                    ),
                    child: const Icon(
                      Icons.branding_watermark,
                      color: AppColors.yellow,
                      size: 34,
                    ),
                  ),
                  const Text('Upload KTP')
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 12),
            child: CustomField(
              label: 'NIK',
              padding: EdgeInsets.only(bottom: 4),
            ),
          ),
        ],
      ),
    );
  }
}
