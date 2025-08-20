
import 'package:al_barq/src/core/constants/app_strings.dart' show StringData;

extension StringExt on String? {
  String? get validateEmail {
    if (this == null) return null;
    if (RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this!)) {
      return null;
    } else {
      return StringData.enterValidEmailAddress;
    }
  }

  String get capitalizeFirstWord {
    if (this == null) return '';
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }
}
