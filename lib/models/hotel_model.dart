import 'package:cloud_firestore/cloud_firestore.dart';

class HotelModel {
  final String? id;
  final String? name;
  final String? cover;
  final String? description;
  final String? location;
  final int? price;
  final double? rate;
  final String? category;
  final List<String>? image;
  final List<Map<String, dynamic>>? activity;

  const HotelModel({
    this.id,
    this.name,
    this.cover,
    this.description,
    this.location,
    this.price,
    this.rate,
    this.category,
    this.image,
    this.activity,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      cover: json['cover'],
      description: json['description'],
      location: json['location'],
      price: json['price'],
      rate: json['rate'],
      category: json['category'],
      image: List<String>.from(json['image'].map((x) => x)),
      activity: List<Map<String, dynamic>>.from(json['activity']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cover': cover,
        'description': description,
        'location': location,
        'price': price,
        'rate': rate,
        'category': category,
        'image': List<dynamic>.from(image!.map((x) => x)),
        'activity': activity,
      };

  factory HotelModel.fromSnapshot(DocumentSnapshot snapshot) {
    return HotelModel(
      id: snapshot.id,
      name: snapshot['name'],
      cover: snapshot['cover'],
      description: snapshot['description'],
      location: snapshot['location'],
      price: snapshot['price'],
      rate: snapshot['rate'],
      category: snapshot['category'],
      image: List<String>.from(snapshot['image'].map((x) => x)),
      activity: List<Map<String, dynamic>>.from(snapshot['activity']),
    );
  }
}
