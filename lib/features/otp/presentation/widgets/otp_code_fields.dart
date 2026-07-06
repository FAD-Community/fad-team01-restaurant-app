import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpCodeFields extends StatelessWidget {

  final VoidCallback onCompleted;
  final VoidCallback onChanged;

  const OtpCodeFields({
    super.key,
    required this.onCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,

      showFieldAsBox: true,

      fieldWidth: 65,

      borderRadius: BorderRadius.circular(16),

      fillColor: Colors.white,

      filled: true,

      borderColor: const Color(0xff4CAF50),

      focusedBorderColor: const Color(0xff4CAF50),

      enabledBorderColor: Colors.transparent,

      onCodeChanged: (_) {
        onChanged();
      },

      onSubmit: (_) {
        onCompleted();
      },
    );
  }
}