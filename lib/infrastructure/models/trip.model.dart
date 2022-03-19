import 'package:flutter/foundation.dart';

class Trip {

  Trip({
    required this.id,
    required this.title,
    required this.description,
    required this.finalPrice,
    required this.originalPrice,
    required this.imageUrls,
    required this.hoster
  });

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
    id: json['id'] ?? '',
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    originalPrice: json['originalPrice'] ?? '',
    finalPrice: json['finalPrice'] ?? '',
    hoster: json['hoster'] ?? '',
    imageUrls: json['imageUrls'] ?? <String>[]
  );

  String id;
  String title;
  String description;
  double finalPrice;
  double originalPrice;
  List<String> imageUrls;
  String hoster;

  Map<String, Object> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'originalPrice': originalPrice,
    'finalPrice': finalPrice,
    'hoster': hoster,
    'imageUrls': imageUrls
  };
}
