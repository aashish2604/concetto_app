class SponsorsModel {
  int id;
  String name;
  String logo;
  String url;
  String category;

  SponsorsModel(
      {required this.id,
      required this.category,
      required this.name,
      required this.logo,
      required this.url});

  factory SponsorsModel.fromJson(Map<String, dynamic> json) {
    return SponsorsModel(
        category: json['category'],
        id: json['id'],
        name: json['name'],
        logo: json['logo'],
        url: json['url']);
  }
}
