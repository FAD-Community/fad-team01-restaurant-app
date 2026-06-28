import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
        final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height: h*0.1,
        decoration: const BoxDecoration(
          color: Color(0xffEDEDED),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 18),
        ),
      ),
    );
  }
}
