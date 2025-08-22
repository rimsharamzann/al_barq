import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class TextFeildWithTitle extends StatelessWidget {
  const TextFeildWithTitle({
    super.key,
    this.title,
    required this.label,
    required this.controller,
    this.obsecureText,
    this.sufix,
    this.maxlines,
    this.height,
  });
  final String? title;
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
        if (title != null) ...[
          Text(
            title!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
        ],
        TextFormField(
          expands: false,
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black.withValues(alpha: 0.7),
          ),
          controller: controller,

          cursorHeight: 26,
          cursorColor: Colors.black54,
          decoration: InputDecoration(
            errorMaxLines: 2,
            prefixIconColor: Colors.black54,
            hintText: label,

            // label: Text(label),
            hintStyle: TextStyle(
              color: MyColors.textColor.withValues(alpha: 0.8),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade100, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),

            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade300, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),

            errorStyle: TextStyle(
              color: Colors.red.shade600,
              fontSize: 10,
              fontWeight: FontWeight.w100,
            ),

            floatingLabelStyle: TextStyle(
              color: MyColors.textColor.withValues(alpha: 0.8),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            suffixStyle: TextStyle(
              color: MyColors.textColor.withValues(alpha: 0.8),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            fillColor: Colors.grey.shade200,
            helperStyle: TextStyle(
              color: MyColors.textColor.withValues(alpha: 0.8),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            labelStyle: TextStyle(
              color: MyColors.textColor.withValues(alpha: 0.8),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
