import 'package:flutter/material.dart';

class CustomSelectField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String label;
  final bool isMandatory;
  final List<DropdownMenuItem<dynamic>> items;
  const CustomSelectField({
    super.key,
    this.textEditingController,
    required this.label,
    this.isMandatory = true,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                if (isMandatory)
                  WidgetSpan(
                      child: Container(
                    height: 16,
                    padding: const EdgeInsets.only(top: 1.0, right: 4),
                    child: const Text(
                      '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  )),
                TextSpan(
                  text: label.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          DropdownButtonFormField(
            items: items,
            onChanged: (_) {},
            decoration: InputDecoration(
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.white10,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.white10,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
