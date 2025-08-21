import 'package:al_barq/config/on_generate_route.dart';
import 'package:al_barq/config/theme_data.dart'
    // ignore: library_prefixes
    as MainThemeData
    show lightThemeData;
import 'package:al_barq/src/features/auth/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Colors.grey.shade100,
      title: 'Al Barq',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      theme: MainThemeData.lightThemeData(context),
    );
  }
}
