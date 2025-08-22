import 'package:al_barq/src/core/components/nav_bar.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/settings/models/notification_model.dart';
import 'package:flutter/material.dart';

import '../../../core/components/general_container.dart';
import '../../../core/constants/assets_strings.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const routeName = '/notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Notifications'),
      body: ListView.builder(
        itemCount: NotificationModel.notificationDummyData.length,
        itemBuilder: (context, index) {
          final notifications = NotificationModel.notificationDummyData;
          return NotificationCard(notification: notifications[index]);
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
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
                  notification.title,
                  style: context.textTheme.bodyLarge?.copyWith(fontSize: 16),
                ),

                Text(
                  notification.description,
                  style: context.textTheme.labelSmall?.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    textAlign: TextAlign.right,
                    notification.date,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: MyColors.primaryColor,
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
