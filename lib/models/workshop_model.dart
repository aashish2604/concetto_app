class WorkShopModel {
  int id;
  String name;
  String summary;
  String details;
  String registerLink;
  String image;
  DateTime registerTimestamp;
  DateTime startTimestamp;
  DateTime endTimestamp;
  String venue;

  WorkShopModel(
      {required this.id,
      required this.name,
      required this.summary,
      required this.details,
      required this.registerLink,
      required this.image,
      required this.registerTimestamp,
      required this.startTimestamp,
      required this.endTimestamp,
      required this.venue});

  factory WorkShopModel.fromJson(Map<String, dynamic> json) {
    DateTime startTime = DateTime.parse(json['start_timestamp']);
    DateTime registerTime = DateTime.parse(json['register_timestamp']);
    DateTime endTime = DateTime.parse(json['end_timestamp']);

    return WorkShopModel(
        id: json['id'],
        name: json['name'],
        summary: json['summary'],
        details: json['details'],
        registerLink: json['register_link'],
        image: json['image'],
        registerTimestamp: registerTime,
        startTimestamp: startTime,
        endTimestamp: endTime,
        venue: json['venue']);
  }
}

/* {
        "id": 1,
        "name": "Test Name",
        "summary": "Test Summary",
        "details": "esses edes dse dse ds ed",
        "register_link": "https://google.com",
        "image": "https://admin.concetto.in/media/workshop_images/website_logo.png",
        "register_timestamp": "2022-10-17T23:42:33+05:30",
        "start_timestamp": "2022-10-17T23:42:35+05:30",
        "end_timestamp": "2022-10-17T23:42:38+05:30",
        "venue": "NLHC"
    } */

