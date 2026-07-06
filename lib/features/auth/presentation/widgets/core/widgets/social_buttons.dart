import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'design_social_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  void onGooglePressed() {

  }

  void onApplePressed() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          asset: 'assets/splash/google_icon.svg',
          onPressed: onGooglePressed,
        ),

        SizedBox(width: 24.w),

        SocialButton(
          asset: 'assets/splash/apple_icon.svg',
          onPressed: onApplePressed,
        ),
      ],
    );
  }
}