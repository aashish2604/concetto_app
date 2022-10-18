/*
{
        "id": 1,
        "name": "Test Name",
        "college": "Test College",
        "position": 1,
        "event": 12
    }
*/

class WinnerModel {
  int id;
  String name;
  String college;
  int position;
  int event;

  WinnerModel({
    required this.id,
    required this.name,
    required this.college,
    required this.position,
    required this.event,
  });

  factory WinnerModel.fromJson(Map<String, dynamic> json) {
    return WinnerModel(
        id: json['id'],
        name: json['name'],
        college: json['college'],
        position: json['position'],
        event: json['event']);
  }
}
