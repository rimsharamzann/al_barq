import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
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
      width: 56,
      height: 56,
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      AssetString.logoD,
                      fit: BoxFit.contain,
                      height: 180,
                      width: 180,
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
                  onCompleted: (pin) {
                    debugPrint('Entered OTP: $pin');
                  },
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
