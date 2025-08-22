// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/theme_data.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/nav_bar.dart';
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
                SizedBox(height: myPadding / 2),
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
          const SizedBox(height: myPadding / 2),
          _userData(),
          const SizedBox(height: myPadding),
          _title('Personal Information'),
          TextFeildWithTitle(
            title: 'Name',
            label: 'Ayesha',
            controller: _nameController,
          ),
          const SizedBox(height: myPadding / 2),
          TextFeildWithTitle(
            title: 'Email',
            label: 'ayesha@gmail.com',
            controller: _emailController,
          ),
          const SizedBox(height: myPadding / 2),
          TextFeildWithTitle(
            title: 'Password',
            label: '********',
            controller: _passwordController,
          ),
          const SizedBox(height: myPadding / 2),
          TextFeildWithTitle(
            title: 'Phone Number',
            label: '09876543',
            controller: _phoneController,
          ),
          const SizedBox(height: myPadding / 2),
          TextFeildWithTitle(
            title: 'City',
            label: 'Multan',
            controller: _cityController,
          ),
          const SizedBox(height: myPadding / 2),
          TextFeildWithTitle(
            title: 'Zip Code',
            label: '8000',
            controller: _zipCOdeController,
          ),
          const SizedBox(height: myPadding / 2),
          TextFeildWithTitle(
            title: 'Address',
            label: '3891 Ranchview Dr. Richardson, California 62639 ',
            controller: _addressController,
          ),
          const SizedBox(height: myPadding / 2),

          const SizedBox(height: myPadding * 6),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: myPadding / 2),
          child: CustomElevatedButton(
            text: 'Save',
            onPress: () {
              Navigator.pushNamed(context, Navbar.routeName);
            },
          ),
        ),
      ),
      extendBody: true,
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
                  height: myPadding * 2.2,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.mode_edit_outline_outlined,
                      size: myPadding,
                      color: Colors.white,
                    ),
                    onPressed: _showImagePickerOptions,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: myPadding / 2),
        Text('Aysha Umar', style: context.textTheme.bodyLarge),
        const SizedBox(height: myPadding / 3),
        Text(
          'abc@gmail.com',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: myPadding / 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined, color: Colors.black54),
            SizedBox(width: myPadding / 3),
            Text(
              'Multan',
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _title(String title) {
    return Text(title, style: context.textTheme.bodyLarge);
  }
}
