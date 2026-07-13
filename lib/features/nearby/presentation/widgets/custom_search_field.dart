import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onTap,
    required this.pathIconSvg,
    this.focusNode,
  });
  final TextEditingController controller;
  final String hintText;
  final FocusNode? focusNode;
  final String pathIconSvg;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          focusNode: widget.focusNode,
          controller: widget.controller,
          onChanged: (value) {
            widget.onChanged?.call(value);
            setState(() {});
          },
          maxLines: 1,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTextStyles.caption.copyWith(
              color: const Color(0xff473426).withOpacity(.5),
            ),

            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 7.w),
              child: SvgPicture.asset(
                widget.pathIconSvg,
                width: 16.w,
                height: 16.h,
              ),
            ),

            suffixIcon: widget.controller.text.isNotEmpty
                ? IconButton(
                    splashRadius: 18,
                    icon: Icon(
                      Icons.close_rounded,
                      size: 18.sp,
                      color: Colors.grey.shade500,
                    ),
                    onPressed: () {
                      widget.controller.clear();

                      widget.onChanged?.call("");
                      setState(() {});
                    },
                  )
                : null,

            filled: true,
            fillColor: AppColors.scaffoldBackground,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide.none,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: BorderSide.none,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: const BorderSide(color: Colors.black12),
            ),
          ),
        ),
      ],
    );
  }
}
