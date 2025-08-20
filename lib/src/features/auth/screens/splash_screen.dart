import 'package:al_barq/src/core/constants/assets_strings.dart' show AssetString;
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
     static const routeName = '/splash';


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Navigator.pushNamed(context, RouteNames.homePage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Center(
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SvgPicture.asset(AssetString.logo),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pakistan\'s Solar MarketPlace ',
              style: TextStyle(color: Colors.black87),
            ),
            SizedBox(height: context.height / 2),
          ],
        ),
      ),
    );
  }
}
