import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/components/text_feild_with_title.dart';
import 'package:al_barq/src/features/orders/screens/billing_info.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  static const routeName = '/check-out';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneControlle = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      padding: EdgeInsets.all(16),
      title: 'Check out',
      body: ListView(
        children: [
          _title('Personal Information'),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Recipient Name',
            label: 'rimsha',
            controller: _nameController,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Phone Number',
            label: '0987654329876',
            controller: _phoneControlle,
          ),
          SizedBox(height: 16),
          _title('Shipping Information'),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'City',
            label: 'multan',
            controller: _cityController,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Zip Code',
            label: '806',
            controller: _zipCodeController,
          ),

          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Address',
            label: 'abc, street, multan',
            controller: _addressController,
          ),
          SizedBox(height: 16),
          CustomElevatedButton(
            text: 'Next',
            onPress: () {
              Navigator.pushNamed(context, BillingInformation.routeName);
            },
          ),
          SizedBox(height: 160),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
