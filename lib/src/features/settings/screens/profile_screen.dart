import 'package:al_barq/config/route_names.dart';
import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:flutter/material.dart';

import '../../../core/components/text_feild_with_title.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Profile',
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          SizedBox(height: 10),

          _userData(),
          SizedBox(height: 16),

          _title('Personal Information'),

          TextFeildWithTitle(
            title: 'Name',
            label: 'Ayesha',
            controller: _nameController,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Email',
            label: 'ayesha@gmail.com',
            controller: _emailController,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Password',
            label: '********',
            controller: _passwordController,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Phone Number',
            label: '09876543',
            controller: _phoneController,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'City',
            label: 'Multn',
            controller: _cityController,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Zip Code',
            label: '8000',
            controller: _zipCOdeController,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Address',
            label: '3891 Ranchview Dr. Richardson, California 62639 ',
            controller: _addressController,
          ),
          SizedBox(height: 10),

          ButtonWidget(
            text: 'Save',
            onPress: () {
              Navigator.pushNamed(context, RouteNames.homePage);
            },
          ),
          SizedBox(height: 10),
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
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(AssetString.solar),
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
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Aysha Umar',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'abc@gmail.com',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
      style: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
