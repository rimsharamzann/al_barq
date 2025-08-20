import 'package:al_barq/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.suffixIcon,
    required this.controller,
    this.prefixIcon,
    this.validator,
    this.obsecureText = false,
    this.readOnly,
    this.enabled = true,
    this.onTap,
    this.expand,
    this.textInputType,
    this.maxLines,
    this.height,
  });

  final String label;
  final Icon? prefixIcon;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool obsecureText;
  final bool? readOnly;
  final Function()? onTap;
  final bool? enabled;
  final int? maxLines;
  final bool? expand;
  final double? height;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55,
      child: InkWell(
        onTap: onTap,
        child: TextFormField(
          expands: expand ?? false,
          maxLines: maxLines ?? 1,
          keyboardType: textInputType ?? TextInputType.emailAddress,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black.withValues(alpha: 0.7),
          ),
          controller: controller,
          obscureText: obsecureText,
          readOnly: readOnly ?? false,
          enabled: enabled,
          cursorHeight: 26,
          cursorColor: Colors.black54,
          decoration: Constants.inputDecoration(
            label,
            suffixIcon,
            Colors.grey.shade300,
            prefixIcon,
          ),
          validator: validator,
        ),
      ),
    );
  }
}
