import 'package:al_barq/src/core/components/custom_container.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/constants/assets_strings.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
    static const routeName = '/notification';


  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Notifications',
      body: ListView(
        children: [
          NotificationCard(
            description:
                'New Updated version is live now, Go and update your app now...',
            title: 'New Updated Version',
            date: 'June 24, 2025',
          ),
          NotificationCard(
            description:
                'Your order has been successfully delivered to your address.',
            title: 'Order Delivered',
            date: 'June 24, 2025',
          ),
          NotificationCard(
            description: 'Your order has been placed and is being processed.',
            title: 'Order Placed Successfully',
            date: 'June 24, 2025',
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.date,
    required this.description,
  });
  final String title;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: _icon()),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    textAlign: TextAlign.right,
                    date,
                    style: TextStyle(
                      fontSize: 14,
                      color: MyColors.primaryColor,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _icon() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: Color(0xfffecfbd),
          child: Image.asset(AssetString.albarq),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6, right: 6),
          child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: Icon(Icons.circle, color: Colors.red, size: 14),
            ),
          ),
        ),
      ],
    );
  }
}
