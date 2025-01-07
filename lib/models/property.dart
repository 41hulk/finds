import 'user.dart';

class Property {
  final String id;
  final List<String> images;
  final String name;
  final String description;
  final String pricePerNight;
  final String address;
  final User user;

  Property({
    required this.id,
    required this.images,
    required this.name,
    required this.description,
    required this.pricePerNight,
    required this.address,
    required this.user,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      pricePerNight: json['pricePerNight'] ?? '',
      address: json['address'] ?? '',
      user: User.fromJson(json['user']),
    );
  }
}
