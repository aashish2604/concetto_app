class ExhibitionModel {
  int id;
  String name;
  String summary;
  String details;
  String image;
  DateTime startTimestamp;
  DateTime endTimestamp;
  String venue;

  ExhibitionModel(
      {required this.id,
      required this.name,
      required this.summary,
      required this.details,
      required this.image,
      required this.startTimestamp,
      required this.endTimestamp,
      required this.venue});

  factory ExhibitionModel.fromJson(Map<String, dynamic> json) {
    DateTime startTime = DateTime.parse(json['start_timestamp']);
    DateTime endTime = DateTime.parse(json['end_timestamp']);

    return ExhibitionModel(
        id: json['id'],
        name: json['name'],
        summary: json['summary'],
        details: json['details'],
        image: json['image'],
        startTimestamp: startTime,
        endTimestamp: endTime,
        venue: json['venue']);
  }
}
  /*{
        "id": 1,
        "name": "Test Event 2",
        "summary": "Test Guest Summary",
        "details": "Some test dummy data",
        "image": "https://admin.concetto.in/media/exhibition_images/concetto_banner.png",
        "start_timestamp": "2022-10-17T23:24:30+05:30",
        "end_timestamp": "2022-10-17T23:24:32+05:30",
        "venue": "SAC"
    } */
