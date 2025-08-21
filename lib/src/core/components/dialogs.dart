// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/orders/screens/order_screen.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String routeName;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.message,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.green.shade700,
              child: Icon(Icons.thumb_up_alt, color: Colors.white),
            ),
            SizedBox(height: myPadding / 2),
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
      ),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key,
    required this.onImagePicked,
    required this.child,
  });
  final Function(File?) onImagePicked;
  final Widget child;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _showImagePickerOptions() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a photo'),
                onTap: () async {
                  final XFile? file = await _picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (file != null) {
                    setState(() => _pickedImage = File(file.path));
                    widget.onImagePicked(_pickedImage);
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from gallery'),
                onTap: () async {
                  final XFile? file = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (file != null) {
                    setState(() => _pickedImage = File(file.path));
                    widget.onImagePicked(_pickedImage);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: _showImagePickerOptions, child: widget.child);
  }
}

class ReviewsDialog extends StatelessWidget {
  const ReviewsDialog({super.key});

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
            child: Icon(Icons.check, color: Colors.white),
          ),
          SizedBox(height: myPadding / 2),
          Text(
            'Thank You for your feedback!',
            textAlign: TextAlign.center,

            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: CustomElevatedButton(
        text: 'Back to orders',
        onPress: () {
          Navigator.pushNamed(context, OrderScreen.routeName);
        },
      ),
    );
  }
}
