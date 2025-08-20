import 'package:al_barq/config/route_names.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/text_feild_with_title.dart';

class BillingInformation extends StatefulWidget {
  const BillingInformation({super.key});

  @override
  State<BillingInformation> createState() => _BillingInformationState();
}

class _BillingInformationState extends State<BillingInformation> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberControlle = TextEditingController();
  final TextEditingController _cardExpiryDate = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Billing Information',
      body: Column(
        children: [
          _title('Payment Information'),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Account Holder Name',
            label: 'enter',
            controller: _nameController,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Card Number',
            label: 'enter',
            controller: _cardNumberControlle,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'Card Expiry',
            label: 'enter',
            controller: _cardExpiryDate,
          ),
          SizedBox(height: 10),
          TextFeildWithTitle(
            title: 'CVV',
            label: 'enter',
            controller: _cvvController,
          ),
          SizedBox(height: 16),
          ButtonWidget(
            text: 'Next',
            onPress: () {
              Navigator.pushNamed(context, RouteNames.reviewOrder);
            },
          ),
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
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
