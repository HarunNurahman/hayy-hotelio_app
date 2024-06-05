class HotelModel {
  final String? id;
  final String? name;
  final String? cover;
  final List<String>? image;
  final int? price;
  final String? location;
  final double? rate;
  final String? description;
  final List<Map<String, dynamic>>? activity;
  final String? category;

  HotelModel({
    this.id,
    this.name,
    this.cover,
    this.image,
    this.price,
    this.location,
    this.rate,
    this.description,
    this.activity,
    this.category,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        id: json["id"],
        name: json["name"],
        cover: json["cover"],
        image: List<String>.from(json["image"].map((x) => x)),
        price: json["price"],
        location: json["location"],
        rate: json["rate"].toDouble(),
        description: json["description"],
        activity: List<Map<String, dynamic>>.from(json["activity"]),
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover": cover,
        "image": List<dynamic>.from(image!.map((x) => x)),
        "price": price,
        "location": location,
        "rate": rate,
        "description": description,
        "activity": activity,
        "category": category,
      };
}
