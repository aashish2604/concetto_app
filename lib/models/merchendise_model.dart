/*
  {
        "id": 1,
        "name": "Test Mechendise Name",
        "image": "https://admin.concetto.in/media/mechandise_images/concetto_banner.png",
        "price": 200.0,
        "description": "Sometinhf sede daiwjd aawhd drfbrb cesohc besiu"
    }
 */

class MerchendiseModel {
  int id;
  String name;
  String image;
  double price;
  String description;
  String? url;

  MerchendiseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    this.url,
  });

  factory MerchendiseModel.fromJson(Map<String, dynamic> json) {
    return MerchendiseModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      url: json['url'],
    );
  }
}
