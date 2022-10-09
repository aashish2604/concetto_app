class SponsorsModel {
  int id;
  String name;
  String logo;
  String url;

  SponsorsModel(
      {required this.id,
      required this.name,
      required this.logo,
      required this.url});

  factory SponsorsModel.fromJson(Map<String, dynamic> json) {
    return SponsorsModel(
        id: json['id'],
        name: json['name'],
        logo: json['logo'],
        url: json['url']);
  }
}
