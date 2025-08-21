import 'package:flutter/material.dart';

enum OrderStatus {
  all,
  confirmed,
  processing,
  shipping;

  String get title {
    switch (this) {
      case all:
        return 'All';
      case confirmed:
        return 'Confirmed';
      case processing:
        return 'Processing';
      case shipping:
        return 'Shipping';
    }
  }

  Color get color {
    switch (this) {
      case all:
        return Colors.white;
      case confirmed:
        return Colors.green;
      case processing:
        return Colors.blue;
      case shipping:
        return Colors.red;
    }
  }
}
