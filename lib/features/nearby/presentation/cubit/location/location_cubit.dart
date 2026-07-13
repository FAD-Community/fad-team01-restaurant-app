import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ka3da/features/nearby/data/data/cities.dart';
import 'package:ka3da/features/nearby/data/models/city_model.dart';
import 'package:ka3da/features/nearby/presentation/widgets/card/card_model.dart';
import 'package:ka3da/features/nearby/services/location_service.dart';
import 'package:ka3da/features/nearby/services/restaurant_local_service.dart';

import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState());

  final LocationService _locationService = LocationService();
  final RestaurantLocalService _restaurantService = RestaurantLocalService();

  Future<void> loadRestaurants() async {
    final restaurants = await _restaurantService.getRestaurants();

    emit(state.copyWith(allRestaurants: restaurants, restaurants: restaurants));
  }

  void selectCity(CityModel city) {
    final restaurants = state.allRestaurants
        .where((e) => e.cityId == city.id)
        .toList();

    emit(
      state.copyWith(
        selectedCity: city,
        restaurants: restaurants,
        searchQuery: "",
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    emit(state.copyWith(isLoadingLocation: true));

    try {
      final position = await _locationService.getCurrentLocation();

      CityModel nearestCity = egyptCities.first;
      double minDistance = double.infinity;

      for (final city in egyptCities) {
        final distance = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          city.latitude,
          city.longitude,
        );

        if (distance < minDistance) {
          minDistance = distance;
          nearestCity = city;
        }
      }

      selectCity(nearestCity);

      emit(state.copyWith(isLoadingLocation: false));
    } catch (_) {
      emit(state.copyWith(isLoadingLocation: false));
    }
  }

  void searchRestaurants(String query) {
    List<RestaurantEntity> list;

    if (query.trim().isEmpty) {
      if (state.selectedCity != null) {
        list = state.allRestaurants
            .where((e) => e.cityId == state.selectedCity!.id)
            .toList();
      } else {
        list = state.allRestaurants;
      }

      emit(state.copyWith(restaurants: list, searchQuery: ""));

      return;
    }

    list = state.allRestaurants.where((restaurant) {
      final matchName = restaurant.name.toLowerCase().contains(
        query.toLowerCase(),
      );

      if (state.selectedCity == null) {
        return matchName;
      }

      return matchName && restaurant.cityId == state.selectedCity!.id;
    }).toList();

    emit(state.copyWith(restaurants: list, searchQuery: query));
  }

  void addRecent(RestaurantEntity restaurant) {
    final recent = List<RestaurantEntity>.from(state.recentSearches);

    recent.removeWhere((e) => e.id == restaurant.id);

    recent.insert(0, restaurant);

    if (recent.length > 8) {
      recent.removeLast();
    }

    emit(state.copyWith(recentSearches: recent));
  }

  void clearRecentSearches() {
    emit(state.copyWith(recentSearches: []));
  }

  List<RestaurantEntity> getSuggestions(String query) {
    if (query.trim().isEmpty) {
      return state.recentSearches;
    }

    return state.allRestaurants.where((restaurant) {
      final match = restaurant.name.toLowerCase().contains(query.toLowerCase());

      if (state.selectedCity == null) {
        return match;
      }

      return match && restaurant.cityId == state.selectedCity!.id;
    }).toList();
  }

  void selectSuggestion(RestaurantEntity restaurant) {
    addRecent(restaurant);

    moveRestaurantToTop(restaurant);

    emit(state.copyWith(searchQuery: restaurant.name));
  }

  void moveRestaurantToTop(RestaurantEntity restaurant) {
    final list = List<RestaurantEntity>.from(state.restaurants);

    list.removeWhere((e) => e.id == restaurant.id);

    list.insert(0, restaurant);

    emit(state.copyWith(restaurants: list));
  }

  void removeRecent(RestaurantEntity restaurant) {
    final list = List<RestaurantEntity>.from(state.recentSearches);

    list.removeWhere((e) => e.id == restaurant.id);

    emit(state.copyWith(recentSearches: list));
  }
}
