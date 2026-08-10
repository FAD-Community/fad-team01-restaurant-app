import 'package:flutter/material.dart';
import 'package:ka3da/features/booking/data/data/bookings_dummy.dart';
import 'package:ka3da/features/booking/presentation/widgets/booking_card.dart';
import 'package:ka3da/features/booking/presentation/widgets/empty_booking.dart';

class UpcomingBookingsTab extends StatelessWidget {
  const UpcomingBookingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    if (bookings.isEmpty) {
      return const EmptyBooking(
        title: "No upcoming reservations",
        subtitle: "Explore the finest dining spots",
        buttonText: "Book Now",
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (_, index) {
          return const BookingCard();
        },
      );
    }
  }
}
