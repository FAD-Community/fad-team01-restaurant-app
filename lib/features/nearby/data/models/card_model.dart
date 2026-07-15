import 'package:ka3da/core/widgets/search/models/searchable.dart';

class RestaurantEntity implements Searchable {
  final int? id;
  final int? cityId;

  final String image;
  final String name;
  final String category;
  final String price;

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
    required this.rating,
    required this.time,
    required this.isOpen,
    required this.isFavorite,
    required this.latitude,
    required this.longitude,
  });

  factory RestaurantEntity.fromJson(Map<String, dynamic> json) {
    return RestaurantEntity(
      id: json["id"],
      cityId: json["cityId"],
      image: json["image"],
      name: json["name"],
      category: json["category"],
      price: json["price"],
      rating: (json["rating"] as num).toDouble(),
      time: json["time"],
      isOpen: json["isOpen"],
      isFavorite: json["isFavorite"],
      latitude: (json["latitude"] as num).toDouble(),
      longitude: (json["longitude"] as num).toDouble(),
    );
  }

  @override
  String get title => name;

  @override
  String get subtitle => category;

  @override
  String? get imageUrl => image;
}
