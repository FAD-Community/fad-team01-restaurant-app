import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.pathIconSvg,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.onClear,
    this.enabled = true,
    this.autofocus = false,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;

  final String hintText;
  final String pathIconSvg;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onClear;

  final bool enabled;
  final bool autofocus;
  final bool readOnly;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_refresh);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
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
                  widget.onClear?.call();
                  widget.onClear?.call();
                },
              )
            : null,
        filled: true,
        fillColor: AppColors.scaffoldBackgroundAlt,
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
       
      ),
    );
  }
}
