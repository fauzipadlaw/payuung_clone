// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String label;
  final bool isMandatory;
  final IconData? suffix;
  final bool disabled;
  final void Function()? onTap;
  final EdgeInsets padding;
  final TextEditingController? controller;
  const CustomField({
    super.key,
    this.textEditingController,
    required this.label,
    this.isMandatory = true,
    this.suffix,
    this.onTap,
    this.disabled = false,
    this.padding = const EdgeInsets.only(bottom: 16.0),
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
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
          TextFormField(
            controller: controller,
            readOnly: onTap != null,
            enabled: !disabled,
            onTap: onTap,
            decoration: InputDecoration(
              filled: disabled,
              fillColor: Colors.grey.shade200,
              suffixIcon: suffix != null ? Icon(suffix!) : null,
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
