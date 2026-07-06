import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class SettingsSwitchTile extends StatelessWidget {
  const SettingsSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.showDivider = true,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 361.w,
                  height: 56.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(8.h),

                      Text(
                        title,
                        style: AppTextStyles.input.copyWith(
                  color: Color(0xff473426)
                )
                      ),

                      if (subtitle != null) ...[
                        Gap(8.h),

                        Text(
                          subtitle!,
                          style: AppTextStyles.subtitle.copyWith(
                  color: Color(0xff473426)
                )
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              FlutterSwitch(
                inactiveColor: Color(0xffFAF3E6),
                activeColor: Color(0xff1A130D),
                width: 64.w,
                height: 32.h,
                value: value,
                onToggle: onChanged,
              ),
            ],
          ),
        ),

        if (showDivider)
          Divider(
            height: 1,
            color: const Color(0xffFAF3E6),
            indent: 1.w,
            endIndent: 1.w,
          ),
      ],
    );
  }
}
