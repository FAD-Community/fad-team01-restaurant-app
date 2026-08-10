enum BookingStatus {
  upcoming,
  pending,
  completed,
  cancelled,
}

class BookingModel {
  final String id;
  final String restaurantName;
  final String restaurantImage;

  final DateTime date;
  final String time;
  final int guests;

  final String confirmationCode;
  final String? specialRequest;

  final BookingStatus status;

  BookingModel({
    required this.id,
    required this.restaurantName,
    required this.restaurantImage,
    required this.date,
    required this.time,
    required this.guests,
    required this.confirmationCode,
    required this.status,
    this.specialRequest,
  });
}