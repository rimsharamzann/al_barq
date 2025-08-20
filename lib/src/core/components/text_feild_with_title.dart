import 'package:al_barq/src/core/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class TextFeildWithTitle extends StatelessWidget {
  const TextFeildWithTitle({
    super.key,
    required this.title,
    required this.label,
    required this.controller,
    this.obsecureText,
    this.sufix,
    this.maxlines,
    this.height,
  });
  final String title;
  final String label;
  final bool? obsecureText;
  final Widget? sufix;
  final int? maxlines;
  final double? height;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        CustomTextField(
          height: height ?? 55,
          maxLines: maxlines ?? 1,
          label: label,
          controller: controller,
          obsecureText: obsecureText ?? false,
          suffixIcon: sufix,
        ),
      ],
    );
  }
}
