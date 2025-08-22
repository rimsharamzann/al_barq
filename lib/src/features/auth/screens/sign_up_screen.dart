import 'package:al_barq/src/core/constants/assets_strings.dart'
    show AssetString;
import 'package:al_barq/src/core/constants/constants.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/text_feild_with_title.dart';
import '../../../core/constants/my_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = '/sign-up';

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
            initialChildSize: 0.87,
            minChildSize: 0.87,
            maxChildSize: 0.87,
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
                      blurRadius: myPadding / 2,
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
  final bool _obscureText = true;
  bool _rememberMe = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: myPadding / 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Center(
          child: Text(
            "Welcome To Al-Barq",
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: myPadding / 2),
        Center(
          child: Text(
            "Enter your details to create an account",
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(height: myPadding),

        // Name
        TextFeildWithTitle(
          title: 'Name',
          controller: _nameController,
          label: 'My Name',
        ),

        // Email
        TextFeildWithTitle(
          title: 'Email',
          controller: _emailController,
          label: 'example@gmail.com',
        ),

        // Password
        PasswordFeild(
          controller: _passwordController,
          obscureText: _obscureText,
        ),

        PasswordFeild(
          title: 'Confirm Password',
          controller: _confirmPasswordController,
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
          ],
        ),

        // Button
        CustomElevatedButton(text: 'Register', onPress: () {}),
        SizedBox(height: myPadding / 3),
        Center(
          child: Text.rich(
            TextSpan(
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black87,
              ),
              children: [
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                  text: 'Login',
                  style: context.textTheme.bodySmall?.copyWith(
                    decoration: TextDecoration.underline,
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.w400,

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
          ),
        ),

        Row(
          children: [
            Expanded(
              child: Divider(color: Colors.grey, height: myPadding / 2),
            ),
            const SizedBox(width: myPadding / 3),
            Text(
              "OR",
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(child: Divider(color: Colors.grey, height: 10)),
          ],
        ),

        GoogleLogin(),
        SizedBox(height: 10),
      ],
    );
  }
}

class PasswordFeild extends StatefulWidget {
  const PasswordFeild({
    super.key,
    required this.obscureText,
    required this.controller,
    this.title,
  });
  final bool obscureText;
  final TextEditingController controller;
  final String? title;

  @override
  State<PasswordFeild> createState() => _PasswordFeildState();
}

class _PasswordFeildState extends State<PasswordFeild> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFeildWithTitle(
      title: widget.title ?? 'Password',
      controller: widget.controller,
      label: '********',
      obsecureText: widget.obscureText,
      sufix: GestureDetector(
        onTap: () {
          setState(() => obscureText = !widget.obscureText);
        },
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            widget.obscureText
                ? AssetString.visibilityOff
                : AssetString.visibility,
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            height: 26,
            width: 26,
          ),
        ),
      ),
    );
  }
}
