import 'package:ka3da/features/nearby/data/models/card_model.dart';
import 'package:ka3da/features/nearby/data/models/city_model.dart';

class LocationState {
  final CityModel? selectedCity;

  /// كل المطاعم
  final List<RestaurantEntity> allRestaurants;

  /// المطاعم المعروضة
  final List<RestaurantEntity> restaurants;

  final bool isLoadingLocation;

  const LocationState({
    this.selectedCity,
    this.allRestaurants = const [],
    this.restaurants = const [],
    this.isLoadingLocation = false,
  });

  LocationState copyWith({
    CityModel? selectedCity,
    List<RestaurantEntity>? allRestaurants,
    List<RestaurantEntity>? restaurants,
    bool? isLoadingLocation,
  }) {
    return LocationState(
      selectedCity: selectedCity ?? this.selectedCity,
      allRestaurants: allRestaurants ?? this.allRestaurants,
      restaurants: restaurants ?? this.restaurants,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
    );
  }
}
