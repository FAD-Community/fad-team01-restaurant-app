import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_back_button.dart';
import 'package:ka3da/core/widgets/custom_button.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_title_sub.dart';

class CreateAccountHeader extends StatelessWidget {
  const CreateAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBackButton(),
        SizedBox(height: 24.h),
        AuthSubtitle(
          "Join now to start booking your dream dining experiences.",
          "Create Account",
        ),
      ],
    );
  }
}
