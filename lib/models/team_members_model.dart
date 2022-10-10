class TeamMembersModel {
  int id;
  String name;
  String image;
  String designation;
  String linkedIn;
  String contact;

  TeamMembersModel({
    required this.id,
    required this.name,
    required this.image,
    required this.designation,
    required this.linkedIn,
    required this.contact,
  });

  factory TeamMembersModel.fromJson(Map<String, dynamic> json) {
    return TeamMembersModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        designation: json['designation'],
        linkedIn: json['linkedin'],
        contact: json['contact']);
  }
}
