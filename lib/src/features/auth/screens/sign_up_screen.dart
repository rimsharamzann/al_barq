import 'package:al_barq/src/core/constants/assets_strings.dart' show AssetString;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/text_feild_with_title.dart';
import '../../../core/constants/my_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  image: AssetImage(AssetString.bgImage),
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

          /// Scrollable Bottom Sheet
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
                  child: SignUpData(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SignUpData extends StatefulWidget {
  const SignUpData({super.key});

  @override
  State<SignUpData> createState() => _SignUpDataState();
}

class _SignUpDataState extends State<SignUpData> {
  bool _obscureText = true;
  bool _rememberMe = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Center(
          child: Text(
            "Welcome To Al-Barq",
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
            "Enter your details to create an account",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Name
        TextFeildWithTitle(
          title: 'Name',
          controller: _nameController,
          label: 'My Name',
        ),
        const SizedBox(height: 10),

        // Email
        TextFeildWithTitle(
          title: 'Email',
          controller: _emailController,
          label: 'example@gmail.com',
        ),
        const SizedBox(height: 10),

        // Password
        TextFeildWithTitle(
          title: 'Password',
          controller: _passwordController,
          label: '********',
          obsecureText: _obscureText,
          sufix: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
        ),

        const SizedBox(height: 10),

        // Checkbox
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
          ],
        ),

        const SizedBox(height: 10),

        // Button
        ButtonWidget(text: 'Register', onPress: () {}),
        const SizedBox(height: 10),

        Center(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                  text: 'Login',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColors.primaryColor,
                    decorationColor: MyColors.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    },
                ),
              ],
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w200,
              fontSize: 12,
            ),
          ),
        ),

        const SizedBox(height: 10),

        // OR Divider
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey, height: 10)),
            const SizedBox(width: 6),
            const Text(
              "OR",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(child: Divider(color: Colors.grey, height: 10)),
          ],
        ),

        const SizedBox(height: 10),

        // Google Button
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
            "Sign up with Google",
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
          onPressed: () {},
        ),

        const SizedBox(height: 10),

        // Already have account? -> Login
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                  text: 'Login',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: MyColors.primaryColor,
                    decorationColor: MyColors.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pop(context);
                    },
                ),
              ],
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w200,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
