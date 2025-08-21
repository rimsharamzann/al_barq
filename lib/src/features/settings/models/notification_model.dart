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
}
