import 'package:al_barq/config/on_generate_route.dart';
import 'package:al_barq/config/theme_data.dart'
    // ignore: library_prefixes
    as MainThemeData
    show lightThemeData;
import 'package:al_barq/firebase_options.dart';
import 'package:al_barq/src/features/auth/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Barq',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      theme: MainThemeData.lightThemeData(context),
    );
  }
}
