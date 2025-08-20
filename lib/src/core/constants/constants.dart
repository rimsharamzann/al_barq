import 'package:al_barq/config/responsive_widget.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/services/navigation_services.dart';
import 'package:flutter/material.dart';

mixin Constants {
  static InputDecoration inputDecoration(
    String label,
    Widget? suffixIcon,
    Color? fillColor,
    final Widget? prefixIcon,
  ) => InputDecoration(
    errorMaxLines: 2,
    suffixIcon: suffixIcon,
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
    fillColor: fillColor ?? Colors.grey.shade300,
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
  );
}

const double myPadding = 10;
BorderRadius borderRadius = BorderRadius.circular(
  ResponsiveWidget.isLargeScreen(
        NavigationService.instance.navigatorKey.currentContext!,
      )
      ? 16
      : 8,
);
BuildContext? myContext =
    NavigationService.instance.navigatorKey.currentContext;

final myHorizontalPadding =
    ResponsiveWidget.isSmallScreen(
      NavigationService.instance.navigatorKey.currentContext!,
    )
    ? 20.0
    : ResponsiveWidget.isMediumScreen(
        NavigationService.instance.navigatorKey.currentContext!,
      )
    ? 40.0
    : 80.0;
const myVerticalPadding = 30.0;
