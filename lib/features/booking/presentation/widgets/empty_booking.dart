import 'package:flutter/material.dart';

class EmptyBooking extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;

  const EmptyBooking({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_month, size: 70),
          Text(title),
          Text(subtitle),
          ElevatedButton(onPressed: () {}, child: Text(buttonText)),
        ],
      ),
    );
  }
}
