import 'package:flutter/material.dart';
import 'package:ka3da/core/theme/text_styles.dart';


class AuthTitle extends StatelessWidget {
  const AuthTitle(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.h1,
    );
  }
}