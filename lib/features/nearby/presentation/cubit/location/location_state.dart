import 'package:ka3da/features/nearby/data/models/city_model.dart';
import 'package:ka3da/features/nearby/presentation/widgets/card/card_model.dart';

class LocationState {
  final CityModel? selectedCity;
  final List<RestaurantEntity> recentSearches;

  /// كل المطاعم
  final List<RestaurantEntity> allRestaurants;

  /// المطاعم المعروضة حاليا
  final List<RestaurantEntity> restaurants;

  final bool isLoadingLocation;
  final String? searchQuery;
  const LocationState({
    this.selectedCity,
    this.allRestaurants = const [],
    this.restaurants = const [],
    this.isLoadingLocation = false,
    this.searchQuery,
    this.recentSearches = const [],
  });

  LocationState copyWith({
    List<RestaurantEntity>? recentSearches,
    String? searchQuery,

    CityModel? selectedCity,
    List<RestaurantEntity>? allRestaurants,
    List<RestaurantEntity>? restaurants,
    bool? isLoadingLocation,
  }) {
    return LocationState(
      recentSearches: recentSearches ?? this.recentSearches,
      selectedCity: selectedCity ?? this.selectedCity,
      allRestaurants: allRestaurants ?? this.allRestaurants,
      restaurants: restaurants ?? this.restaurants,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
