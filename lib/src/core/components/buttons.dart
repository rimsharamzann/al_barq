import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/core/constants/constants.dart';
import 'package:al_barq/src/core/constants/my_colors.dart' show MyColors;
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPress,
    this.loading = false,
  });
  final String text;
  final Function()? onPress;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? () {} : onPress,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(context.width, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myPadding),
        ),
        backgroundColor: loading ? Colors.grey : MyColors.primaryColor,
      ),
      child: loading
          ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: myPadding * 2,
                  vertical: 4,
                ),
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              ),
            )
          : Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(context.width, 45),
        backgroundColor: Colors.blue.shade50,
        side: BorderSide(color: Colors.blue.shade50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
    );
  }
}
