import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final preferences = [
  "Vegetarian",
  "Gluten Free",
  "Dairy Free",
  "Nut Free",
  "Sugar Free",
  "Keto Friendly",
  "Organic / Healthy",
];

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  final Set<String> selectedPreferences = {};
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: preferences.map((item) {
        final isSelected = selectedPreferences.contains(item);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedPreferences.remove(item);
              } else {
                selectedPreferences.add(item);
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xff1A130D) : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isSelected
                    ? const Color.fromARGB(255, 107, 89, 52)
                    : Colors.transparent,
              ),
            ),
            child: Text(
              item,
              style: TextStyle(
                fontSize: 13.sp,
                color: isSelected ? Colors.white : const Color(0xff6E6259),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
