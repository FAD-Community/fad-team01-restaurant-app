import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.height,
    required this.width,
    required this.num,
    required this.text,
    required this.icon,
  });

  final double height;
  final double width;
  final double num;
  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('رابط_الصورة_هنا'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // 2. الـ Glass Effect
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ), // قوة التشويش
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2), // شفافية الزجاج
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3), // لمعان الحواف
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Glass Effect',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
