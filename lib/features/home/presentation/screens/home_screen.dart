import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
  'This is Google Fonts',
  style: GoogleFonts.dmSans(
    fontSize: 30,
    textStyle: const TextStyle(color: Colors.black, letterSpacing: .5),
  ),
)),
    );
  }
}
