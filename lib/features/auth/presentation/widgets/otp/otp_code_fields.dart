import 'package:flutter/material.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:pinput/pinput.dart';

class OtpCodeFields extends StatelessWidget {
  const OtpCodeFields({
    super.key,
    required this.onCompleted,
    required this.onChanged,
  });

  final VoidCallback onCompleted;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final defaultTheme = PinTheme(
      width: 60,
      height: 76,
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.transparent,
        ),
      ),
    );

    return Pinput(
      length: 4,

      defaultPinTheme: defaultTheme,

      focusedPinTheme: defaultTheme.copyDecorationWith(
        border: Border.all(
          color: const Color(0xff4CAF50),
          width: 2,
        ),
      ),

      submittedPinTheme: defaultTheme.copyDecorationWith(
        border: Border.all(
          color: const Color(0xff4CAF50),
          width: 2,
        ),
      ),

      separatorBuilder: (index) => const SizedBox(width: 12),

      onChanged: (_) => onChanged(),

      onCompleted: (_) => onCompleted(),
    );
  }
}