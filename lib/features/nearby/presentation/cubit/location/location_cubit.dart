import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ka3da/features/nearby/data/data/cities.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';
import 'package:ka3da/features/nearby/data/models/city_model.dart';
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

    emit(state.copyWith(selectedCity: city, restaurants: restaurants));
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

  void setRestaurants(List<RestaurantEntity> restaurants) {
    emit(state.copyWith(restaurants: restaurants));
  }
}
