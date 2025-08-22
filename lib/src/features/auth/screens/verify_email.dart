import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/nav_bar.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/core/constants/constants.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});
  static const routeName = '/verify-email';

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: myPadding * 5.6,
      height: myPadding * 5.6,
      textStyle: context.textTheme.bodyMedium?.copyWith(fontSize: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: myPadding * 2.4,
              vertical: myPadding * 6,
            ),
            child: ListView(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      AssetString.logoD,
                      fit: BoxFit.contain,
                      height: myPadding * 18,
                      width: myPadding * 18,
                    ),
                  ),
                ),

                Text(
                  "Verify your email",
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  "Enter code we have sent to your\ninbox example@gmail.com",
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),

                Pinput(
                  keyboardType: TextInputType.number,
                  controller: _otpController,
                  length: 5,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: MyColors.mainColor, width: 2),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme,
                  onCompleted: (pin) {},
                ),

                const SizedBox(height: 32),

                CustomElevatedButton(
                  text: 'Verify',
                  onPress: () {
                    Navigator.pushNamed(context, Navbar.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
