import 'package:flutter/material.dart';

class OtpProgress extends StatelessWidget {
  const OtpProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Expanded(
          child: Container(
            margin: EdgeInsets.only(right: index == 2 ? 0 : 8),
            height: 4,
            decoration: BoxDecoration(
              color: index < 2
                  ? const Color(0xff8B2527)
                  : const Color(0xffE2DACC),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}