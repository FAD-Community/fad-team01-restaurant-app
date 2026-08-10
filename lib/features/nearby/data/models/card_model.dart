import 'package:ka3da/core/widgets/search/models/searchable.dart';

class RestaurantEntity implements Searchable {
  final int? id;
  final int? cityId;

  final String image;
  final String name;
  final String category;
  final String price;
  final String description;
  final String address;
  final String phone;

  final int reviewCount;
  final double rating;
  final int time;

  final bool isOpen;
  final bool isFavorite;

  final double latitude;
  final double longitude;

  const RestaurantEntity({
    this.id,
    this.cityId,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.address,
    required this.phone,
    required this.reviewCount,
    required this.rating,
    required this.time,
    required this.isOpen,
    required this.isFavorite,
    required this.latitude,
    required this.longitude,
  });

  factory RestaurantEntity.fromJson(Map<String, dynamic> json) {
    return RestaurantEntity(
      id: _toInt(json["id"]),
      cityId: _toInt(json["cityId"]),

      image: json["image"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      category: json["category"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",

      description: json["description"]?.toString() ?? "",
      address: json["address"]?.toString() ?? "",
      phone: json["phone"]?.toString() ?? "",

      reviewCount: _toInt(json["reviewCount"]),
      rating: _toDouble(json["rating"]),
      time: _toInt(json["time"]),

      isOpen: _toBool(json["isOpen"]),
      isFavorite: _toBool(json["isFavorite"]),

      latitude: _toDouble(json["latitude"]),
      longitude: _toDouble(json["longitude"]),
    );
  }

  static int _toInt(dynamic value) {
    if (value == null) return 0;

    if (value is int) return value;

    if (value is double) return value.toInt();

    return int.tryParse(value.toString()) ?? 0;
  }

  static double _toDouble(dynamic value) {
    if (value == null) return 0.0;

    if (value is double) return value;

    if (value is int) return value.toDouble();

    return double.tryParse(value.toString()) ?? 0.0;
  }

  static bool _toBool(dynamic value) {
    if (value == null) return false;

    if (value is bool) return value;

    if (value is int) return value == 1;

    final v = value.toString().toLowerCase();

    return v == "true" || v == "1";
  }

  @override
  String get title => name;

  @override
  String get subtitle => category;

  @override
  String? get imageUrl => image;
}
