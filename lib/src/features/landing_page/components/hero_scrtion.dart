
import 'package:al_barq/config/responsive_widget.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/components/buttons.dart';
import '../../../core/constants/assets_strings.dart';
import '../../../core/constants/my_colors.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    final isLarge = ResponsiveWidget.isLargeScreen(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isLarge ? 60 : 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Harness The",
                        style: TextStyle(
                          fontSize: isLarge ? 48 : 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Power Of Sun ",
                        style: TextStyle(
                          fontSize: isLarge ? 48 : 26,
                          fontWeight: FontWeight.bold,
                          color: MyColors.primaryColor,
                          decorationThickness: 4,
                          height: 1.3,
                          textBaseline: TextBaseline.ideographic,
                          decorationColor: MyColors.mainColor,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: "For Your Home",
                        style: TextStyle(
                          fontSize: isLarge ? 48 : 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Premium solar solutions designed for Pakistan's energy needs. "
                  "Save money and contribute to a sustainable future.",
                  style: TextStyle(
                    fontSize: isLarge ? 24 : 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 45,
                  width: context.width / 5.5,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MyColors.mainColor,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: MyColors.primaryColor.withValues(alpha: 0.5),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Zero Load Shedding',
                        style: TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  width: context.width / 4,
                  text: "Get Started",
                  onPress: () {},
                ),
              ],
            ),
          ),

          Flexible(flex: 2, child: _imageWidget()),
        ],
      ),
    );
  }

  Widget _imageWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(AssetString.solar, fit: BoxFit.contain),

          Positioned(
            top: -30,
            left: 0,
            child: _saveEnergy(
              Text(
                '300+ Sunny Days',
                style: TextStyle(
                  color: Colors.black87.withValues(alpha: 0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Colors.red,
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: _saveEnergy(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Save up to',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '70% on bill',
                    style: TextStyle(
                      color: MyColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _saveEnergy(Widget child, Color color) {
    return Container(
      height: 65,
      width: context.width / 5.5,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.grey.shade100,
            offset: Offset(0, 1),
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
        color: MyColors.mainColor,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.1),
            radius: 22,
            child: Icon(
              Icons.wb_sunny_outlined,
              color: color.withValues(alpha: 0.5),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(child: child),
        ],
      ),
    );
  }
}
