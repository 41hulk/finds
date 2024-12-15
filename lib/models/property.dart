import 'dart:ffi';

class Property {
  final String id;
  final String userId;
  final List<String> images;
  final String name;
  final String description;
  final String pricePerNight;
  final String address;
  final DateTime created_at;
  final DateTime updated_at;

  Property({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.images,
    required this.pricePerNight,
    required this.address,
    required this.created_at,
    required this.updated_at,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      pricePerNight: json['pricePerNight'] ?? '',
      address: json['address'] ?? '',
      created_at:
          DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
      updated_at:
          DateTime.parse(json['updated_at'] ?? DateTime.now().toString()),
    );
  }
}
