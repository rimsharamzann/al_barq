class NotificationModel {
  final String title;
  final String date;
  final String description;
  NotificationModel({
    required this.title,
    required this.date,
    required this.description,
  });

  NotificationModel copyWith({
    String? title,
    String? date,
    String? description,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }

  static final List<NotificationModel> notificationDummyData = [
    NotificationModel(
      title: 'New Updated Version',
      description:
          'New Updated version is live now, Go and update your app now...',
      date: 'June 24, 2025',
    ),
    NotificationModel(
      title: 'Order Delivered',
      description:
          'Your order has been successfully delivered to your address.',
      date: 'June 24, 2025',
    ),
    NotificationModel(
      title: 'Order Placed Successfully',
      description: 'Your order has been placed and is being processed.',
      date: 'June 24, 2025',
    ),
  ];
}
