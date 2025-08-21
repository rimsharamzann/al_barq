import 'package:al_barq/src/core/constants/my_colors.dart' show MyColors;
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPress,

    this.borderRadius,
    this.color,
    required this.icon,
    this.size,
  });
  final IconData icon;
  final Function()? onPress;
  final Color? color;
  final double? size;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.white,

        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: IconButton(
        icon: Icon(icon, size: size ?? 16),
        onPressed: onPress,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPress,
    this.loading = false,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.borderRadius,
    this.color,
    this.height,
    this.useGradient = true,
  });

  final String text;
  final double? width;
  final Function()? onPress;
  final bool loading;
  final double? fontSize;
  final Color? color;
  final BorderRadius? borderRadius;
  final FontWeight? fontWeight;
  final double? height;
  final bool useGradient;

  @override
  Widget build(BuildContext context) {
    final buttonHeight =
        height ?? 40 ;

    final radius = borderRadius ?? BorderRadius.circular(30);

    return SizedBox(
      height: buttonHeight,
      width: width ?? context.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: radius,
          gradient: useGradient
              ? const LinearGradient(
                  colors: [Color(0xFFF8A622), Color(0xFFF85B22)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          color: useGradient ? null : (color ?? MyColors.primaryColor),
        ),
        child: ElevatedButton(
          onPressed: loading ? null : onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: radius),
          ),
          child: loading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        fontSize ??
                        12 ,
                    fontWeight: fontWeight ?? FontWeight.w700,
                  ),
                ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPress,
    this.loading = false,
  });
  final String text;
  final Function()? onPress;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: context.width,
      child: ElevatedButton(
        onPressed: loading ? () {} : onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: MyColors.primaryColor,
        ),
        child: loading
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                ),
              )
            : Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
