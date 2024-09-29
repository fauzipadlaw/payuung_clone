import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_field.dart';
import 'package:payuung_clone/utils/colors.dart';

class KtpField extends StatefulWidget {
  final TextEditingController imageController;
  final TextEditingController nikController;
  const KtpField(
      {super.key, required this.imageController, required this.nikController});

  @override
  State<KtpField> createState() => _KtpFieldState();
}

class _KtpFieldState extends State<KtpField> {
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
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? photo =
                    await picker.pickImage(source: ImageSource.camera);
                if (photo != null) {
                  final Directory appDocumentsDir =
                      await getApplicationDocumentsDirectory();
                  final String pathDup = appDocumentsDir.path;
                  final ext = photo.name.split('.')[1];
                  final filename = 'foto-ktp.$ext';
                  final finalPath = '$pathDup/$filename';
                  await photo.saveTo(finalPath);
                  setState(() {
                    widget.imageController.text = filename;
                  });
                }
              },
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
                  Column(
                    children: [
                      const Text('Upload KTP'),
                      Text(widget.imageController.text),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.check_box_rounded,
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
            child: CustomField(
              controller: widget.nikController,
              label: 'NIK',
              padding: const EdgeInsets.only(bottom: 4),
            ),
          ),
        ],
      ),
    );
  }
}
