import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.padding,
    required this.child,
    this.color,
    this.borderRadius,
  });
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final Color? color;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin ?? EdgeInsets.symmetric(vertical: 6),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      width: width ?? context.width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        color: color ?? Colors.white,
      ),
      child: child,
    );
  }
}
