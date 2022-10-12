class NotificationModel {
  int id;
  String title;
  String message;
  DateTime timestamp;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    DateTime time = DateTime.parse(json['timestamp']);
    return NotificationModel(
        id: json['id'],
        title: json['title'],
        message: json['message'],
        timestamp: time);
  }
}
