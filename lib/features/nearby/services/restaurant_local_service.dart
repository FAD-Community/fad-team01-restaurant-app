import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ka3da/features/nearby/presentation/widgets/card/card_model.dart';

class RestaurantLocalService {
  Future<List<RestaurantEntity>> getRestaurants() async {
    final jsonString = await rootBundle.loadString(
      'assets/nearby/data/restaurants.json',
    );

    final List data = json.decode(jsonString);

    return data.map((e) => RestaurantEntity.fromJson(e)).toList();
  }
}
