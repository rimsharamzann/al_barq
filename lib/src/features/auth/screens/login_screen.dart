import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart'
    show AssetString;
import 'package:al_barq/src/core/constants/constants.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/auth/screens/sign_up_screen.dart';
import 'package:al_barq/src/features/auth/screens/verify_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/text_feild_with_title.dart';
import '../../../core/constants/my_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

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
            initialChildSize: 0.75,
            minChildSize: 0.75,
            maxChildSize: 0.75,
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
      spacing: myPadding / 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Welcome Back",
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
        ),
        Center(
          child: Text(
            "Enter your email and password to access your account",
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ),

        TextFeildWithTitle(
          title: 'Email',
          controller: _emailController,
          label: 'examlple@gmail.ocm',
        ),

        PasswordFeild(
          controller: _passwordController,
          obscureText: _obscureText,
        ),
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
            Text(
              "Remember me",
              style: context.textTheme.bodyMedium?.copyWith(fontSize: 14),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, VerifyEmailScreen.routeName);
              },
              child: Text(
                "Forgot password?",
                style: context.textTheme.bodyMedium?.copyWith(
                  color: MyColors.primaryColor,
                ),
              ),
            ),
          ],
        ),

        CustomElevatedButton(
          text: 'Login',
          onPress: () {
            Navigator.pushNamed(context, Navbar.routeName);
          },
        ),
        SizedBox(height: 10),
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Don\'t Have account?'),
                TextSpan(text: ' '),
                TextSpan(
                  text: 'Create account',
                  style: context.textTheme.bodySmall?.copyWith(
                    decoration: TextDecoration.underline,
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
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

            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ),

        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey, height: 10)),
            const SizedBox(width: 6),

            Center(
              child: Text(
                'OR',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(child: Divider(color: Colors.grey, height: 10)),
          ],
        ),

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
          label: Text(
            "Sign in with Google",
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
