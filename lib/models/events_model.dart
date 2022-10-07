class EventModel {
  int id;
  String name;
  String subTitle;
  String summary;
  String details;
  String eventType;
  String brochureLink;
  String registerLink;
  String image;
  DateTime registerTimestamp;
  DateTime startTimestamp;
  DateTime endTimestamp;
  bool eventComplete;
  String venue;

  EventModel(
      {required this.id,
      required this.name,
      required this.subTitle,
      required this.summary,
      required this.details,
      required this.eventType,
      required this.brochureLink,
      required this.registerLink,
      required this.image,
      required this.registerTimestamp,
      required this.startTimestamp,
      required this.endTimestamp,
      required this.eventComplete,
      required this.venue});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    DateTime startTime = DateTime.parse(json['start_timestamp']);
    DateTime registerTime = DateTime.parse(json['register_timestamp']);
    DateTime endTime = DateTime.parse(json['end_timestamp']);

    return EventModel(
        id: json['id'],
        name: json['name'],
        subTitle: json['sub_title'],
        summary: json['summary'],
        details: json['details'],
        eventType: json['event_type'],
        brochureLink: json['brochure_link'],
        registerLink: json['register_link'],
        image: json['image'],
        registerTimestamp: registerTime,
        startTimestamp: startTime,
        endTimestamp: endTime,
        eventComplete: json['event_complete'],
        venue: json['venue']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sub_title'] = subTitle;
    data['summary'] = summary;
    data['details'] = details;
    data['event_type'] = eventType;
    data['brochure_link'] = brochureLink;
    data['register_link'] = registerLink;
    data['image'] = image;
    data['register_timestamp'] = registerTimestamp;
    data['start_timestamp'] = startTimestamp;
    data['end_timestamp'] = endTimestamp;
    data['event_complete'] = eventComplete;
    data['venue'] = venue;
    return data;
  }
}
