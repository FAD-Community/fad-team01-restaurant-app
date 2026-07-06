import 'package:flutter/material.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

class OtpVerifyButton extends StatelessWidget {

  final bool enabled;

  const OtpVerifyButton({
    super.key,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(

      backgroundColor: enabled
          ? const Color(0xff8B2527)
          : const Color(0xffDFD4C5),

      onPressed: enabled
          ? (){
              Navigator.pushNamed(
                context,
                AppRoutes.createNewPasswordScreen,
              );
            }
          : (){},

      child: Text(
        "Verify",
        style: TextStyle(
          color: enabled
              ? Colors.white
              : Colors.grey,
        ),
      ),
    );
  }
}
