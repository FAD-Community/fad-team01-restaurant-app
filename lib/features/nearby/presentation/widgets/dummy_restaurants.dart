import 'package:ka3da/features/nearby/presentation/widgets/card/card_model.dart';

final List<RestaurantEntity> dummyRestaurants = [
  RestaurantEntity(
    image: "assets/nearby/unnamed.jpg",
    name: "KFC | Tanta El Helw",
    category: "Fast food",
    price: "EGP 250-500 pp",
    rating: 4.5,
    time: 5,
    isOpen: true,
    isFavorite: false,
    latitude: 30.798749789821528,
    longitude: 31.004254882811075,
    id: 1,
    cityId: 2,
  ),

  RestaurantEntity(
    image: "assets/nearby/2.jpg",
    name: "واحد برجر",
    category: "Hamburger",
    price: "EGP 300 pp",
    rating: 4.8,
    time: 8,
    isOpen: true,
    isFavorite: true,
    latitude: 30.81462837384738,
    longitude: 30.994385609800453,
    id: 2,
    cityId: 2,
  ),

  RestaurantEntity(
    image: "assets/nearby/images.jpg",
    name: "Bobwich Al estad",
    category: "Fast food",
    price: "EGP 500 pp",
    rating: 4.2,
    time: 12,
    isOpen: false,
    isFavorite: false,
    latitude: 30.786638345401453,
    longitude: 31.00042764061959,
    id: 3,
    cityId: 1,
  ),
];
