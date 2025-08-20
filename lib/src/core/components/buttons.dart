
import 'package:al_barq/config/responsive_widget.dart';
import 'package:al_barq/src/core/constants/constants.dart';
import 'package:al_barq/src/core/constants/my_colors.dart' show MyColors;
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onPress,
    this.width,
  });
  final String text;
  final double? width;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveWidget.isSmallScreen(context) ? 35 : 45,
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade600, width: 1.5),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ButtonsHomePage extends StatelessWidget {
  const ButtonsHomePage({super.key, required this.text, this.onPress});
  final String text;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.15,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.mainColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(text, style: context.textTheme.headlineSmall),
      ),
    );
  }
}

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
        height ?? (ResponsiveWidget.isSmallScreen(context) ? 40 : 46);

    final radius = borderRadius ?? BorderRadius.circular(30);

    return SizedBox(
      height: buttonHeight,
      width: width ?? context.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: radius,
          gradient: useGradient
              ? const LinearGradient(
                  colors: [
                    Color(0xFFF8A622), 
                    Color(0xFFF85B22), 
                  ],
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
                    fontSize: fontSize ??
                        (ResponsiveWidget.isSmallScreen(context) ? 12 : 16),
                    fontWeight: fontWeight ?? FontWeight.w700,
                  ),
                ),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
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

class AppBarButton extends StatefulWidget {
  const AppBarButton({
    super.key,
    required this.text,
    required this.onPress,
    required this.isSelected,
    required this.color,
  });

  final String text;
  final VoidCallback onPress;
  final bool isSelected;
  final Color color;

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: widget.onPress,
        onHover: (val) {
          setState(() {
            isHovered = val;
          });
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          overlayColor: Colors.transparent,
          backgroundColor: Colors.black,
          maximumSize: Size(MediaQuery.of(context).size.width * 0.5, 50),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : widget.color,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class OutLinedButton extends StatelessWidget {
  const OutLinedButton({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
    this.height,
    this.textColor,
    this.iconColor,
    this.borderRadius,
    this.backgroundColor,
  });
  final String text;
  final IconData? icon;
  final Color? textColor;
  final Color? iconColor;
  final Function()? onTap;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? myPadding * 5.5,
      width: myPadding * myPadding * 1.4,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          padding: const EdgeInsets.all(myPadding),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            side: BorderSide(
              color: textColor ?? MyColors.primaryColor,
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: myPadding),
            Text(text, style: TextStyle(color: textColor)),
          ],
        ),
      ),
    );
  }
}

class TextAndIconButton extends StatelessWidget {
  const TextAndIconButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: Row(
          children: [
            Text(text),
            Icon(icon, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onTap,
    this.textColor,
    this.backgroundColor,
    this.height,
    this.borderRadius,
    this.fontSize,
    this.borderColor,
  });
  final String text;
  final Function()? onTap;
  final Color? textColor;
  final Color? backgroundColor;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final double? fontSize;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 35,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(20),
            side: BorderSide(width: 1, color: borderColor ?? Colors.grey),
          ),
          backgroundColor: backgroundColor ?? Colors.transparent,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.grey,
            fontSize: fontSize ?? 15,
          ),
        ),
      ),
    );
  }
}
