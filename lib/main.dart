
import 'package:al_barq/config/on_generate_route.dart';
import 'package:al_barq/config/route_names.dart';
import 'package:al_barq/config/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Barq',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.navbar,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      themeMode: ThemeMode.dark,
      theme: MainThemeData.lightThemeData(context),

      darkTheme: ThemeData.dark(),
    );
  }
}
