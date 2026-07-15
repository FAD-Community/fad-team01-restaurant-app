import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class LocationDropdown extends StatelessWidget {
  const LocationDropdown({
    super.key,
    required this.selectedLocation,
    required this.locations,
    required this.onChanged,
    required this.pathIconSvg,
    required this.hintText,
  });

  final String? selectedLocation;
  final String hintText;
  final List<String> locations;
  final ValueChanged<String?> onChanged;
  final String pathIconSvg;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        hint: Text(hintText),
        isExpanded: true,
        style: AppTextStyles.captionMedium,
        items: locations
            .map(
              (location) => DropdownItem<String>(
                value: location,
                child: Text(location, style: AppTextStyles.captionMedium),
              ),
            )
            .toList(),
    
        valueListenable: ValueNotifier(selectedLocation),
    
        onChanged: onChanged,
    
        buttonStyleData: ButtonStyleData(
          height: 32.h,
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.accent, width: .5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 1.w),
        ),
    
        iconStyleData: IconStyleData(
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 16.sp,
        ),
    
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
    
        selectedItemBuilder: (context) {
          return locations
              .map(
                (location) => Row(
                  children: [
                    SvgPicture.asset(pathIconSvg),
                    Gap(4.w),
                    Expanded(
                      child: Text(
                        location,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
              .toList();
        },
      ),
    );
  }
}
