import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';

class HomeRepository {
  Future<List<RestaurantEntity>> getRestaurants() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/restaurants.json',
    );

    final List data = jsonDecode(jsonString);

    return data
        .map((e) => RestaurantEntity.fromJson(e))
        .toList();
  }
}