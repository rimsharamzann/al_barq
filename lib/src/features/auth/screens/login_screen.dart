import 'package:al_barq/config/route_names.dart';
import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart' show AssetString;
import 'package:al_barq/src/features/auth/screens/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/text_feild_with_title.dart';
import '../../../core/constants/my_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetString.solarPanel),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: 100,
                  child: SvgPicture.asset(AssetString.logo),
                ),
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.55,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: const LoginData(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LoginData extends StatefulWidget {
  const LoginData({super.key});

  @override
  State<LoginData> createState() => _LoginDataState();
}

class _LoginDataState extends State<LoginData> {
  bool _obscureText = true;
  bool _rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Welcome Back",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            "Enter your email and password to access your account",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextFeildWithTitle(
          title: 'Email',
          controller: _emailController,
          label: 'examlple@gmail.ocm',
        ),

        const SizedBox(height: 10),
        TextFeildWithTitle(
          title: 'Password',
          obsecureText: _obscureText,

          controller: _passwordController,
          label: '********',
          sufix: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              onChanged: (val) {
                setState(() => _rememberMe = val!);
              },
              activeColor: MyColors.primaryColor,
              checkColor: Colors.white,
            ),
            const Text(
              "Remember me",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot password?",
                style: TextStyle(color: MyColors.primaryColor),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),
        ButtonWidget(
          text: 'Login',
          onPress: () {
            Navigator.pushNamed(context, RouteNames.homePage);
          },
        ),
        SizedBox(height: 10),
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Don\'t Have account?'),
                TextSpan(
                  text: 'Create account',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColors.primaryColor,
                    decorationColor: MyColors.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                ),
              ],
            ),
            textAlign: TextAlign.center,

            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w200,
              fontSize: 12,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey, height: 10)),
            const SizedBox(width: 6),

            Center(
              child: Text(
                'OR',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(child: Divider(color: Colors.grey, height: 10)),
          ],
        ),

        const SizedBox(height: 10),

        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.blue.shade50,
            side: BorderSide(color: Colors.blue.shade50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          icon: SvgPicture.asset(AssetString.google, height: 20),
          label: const Text(
            "Sign in with Google",
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
