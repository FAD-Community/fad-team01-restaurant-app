import 'package:ka3da/features/booking/data/models/booking_model.dart';

List<BookingModel> bookings = [
  BookingModel(
    id: "1",
    restaurantName: "The Grill House",
    restaurantImage: "assets/nearby/2.jpg",
    date: DateTime(2026, 5, 25),
    time: "9:30 PM",
    guests: 5,
    confirmationCode: "TH-MJE2W",
    status: BookingStatus.upcoming,
  ),

  BookingModel(
    id: "2",
    restaurantName: "Sakura Lounge",
    restaurantImage: "assets/nearby/Rectangle 5.png",
    date: DateTime(2026, 5, 18),
    time: "7:30 PM",
    guests: 2,
    confirmationCode: "SA-KL32",
    status: BookingStatus.completed,
  ),
];
