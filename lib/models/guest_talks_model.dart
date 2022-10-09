class GuestTalksModel {
  int id;
  String guestName;
  String summary;
  String details;
  String registerLink;
  String image;
  DateTime registerTimestamp;
  DateTime startTimestamp;
  DateTime endTimestamp;
  String venue;

  GuestTalksModel(
      {required this.id,
      required this.guestName,
      required this.summary,
      required this.details,
      required this.registerLink,
      required this.image,
      required this.registerTimestamp,
      required this.startTimestamp,
      required this.endTimestamp,
      required this.venue});

  factory GuestTalksModel.fromJson(Map<String, dynamic> json) {
    DateTime startTime = DateTime.parse(json['start_timestamp']);
    DateTime registerTime = DateTime.parse(json['register_timestamp']);
    DateTime endTime = DateTime.parse(json['end_timestamp']);

    return GuestTalksModel(
        id: json['id'],
        guestName: json['guest_name'],
        summary: json['summary'],
        details: json['details'],
        registerLink: json['register_link'],
        image: json['image'],
        registerTimestamp: registerTime,
        startTimestamp: startTime,
        endTimestamp: endTime,
        venue: json['venue']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = guestName;
    data['summary'] = summary;
    data['details'] = details;
    data['register_link'] = registerLink;
    data['image'] = image;
    data['register_timestamp'] = registerTimestamp;
    data['start_timestamp'] = startTimestamp;
    data['end_timestamp'] = endTimestamp;
    data['venue'] = venue;
    return data;
  }
}
