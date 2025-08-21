// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/theme_data.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/layout_widget.dart';
import '../../../core/components/text_feild_with_title.dart';
import '../../../core/constants/assets_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCOdeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _showImagePickerOptions() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          child: SafeArea(
            child: Wrap(
              children: [
                SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Take a photo'),
                  onTap: () async {
                    final XFile? file = await _picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (file != null) {
                      setState(() => _pickedImage = File(file.path));
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
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Profile'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: myPadding),
        children: [
          const SizedBox(height: 10),
          _userData(),
          const SizedBox(height: 16),
          _title('Personal Information'),
          TextFeildWithTitle(
            title: 'Name',
            label: 'Ayesha',
            controller: _nameController,
          ),
          const SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Email',
            label: 'ayesha@gmail.com',
            controller: _emailController,
          ),
          const SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Password',
            label: '********',
            controller: _passwordController,
          ),
          const SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Phone Number',
            label: '09876543',
            controller: _phoneController,
          ),
          const SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'City',
            label: 'Multan',
            controller: _cityController,
          ),
          const SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Zip Code',
            label: '8000',
            controller: _zipCOdeController,
          ),
          const SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Address',
            label: '3891 Ranchview Dr. Richardson, California 62639 ',
            controller: _addressController,
          ),
          const SizedBox(height: 10),
          CustomElevatedButton(
            text: 'Save',
            onPress: () {
              Navigator.pushNamed(context, '/navbar');
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _userData() {
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: _pickedImage != null
                    ? FileImage(_pickedImage!)
                    : const AssetImage(AssetString.solar) as ImageProvider,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.mode_edit_outline_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: _showImagePickerOptions,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Aysha Umar',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'abc@gmail.com',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.location_on_outlined, color: Colors.black54),
            SizedBox(width: 6),
            Text(
              'Multan',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
