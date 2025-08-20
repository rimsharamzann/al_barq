import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;

  const SuccessDialog({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.green.shade700,
            child: Icon(Icons.thumb_up_alt, color: Colors.white),
          ),
          SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
      ),
    );
  }
}
