import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.image, required this.isOpen});
  final String image;
  final bool isOpen;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 98.w,
          height: 118.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.08),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              loadingBuilder: (_, child, progress) {
                if (progress == null) return child;

                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (_, __, ___) {
                return const Center(child: Icon(Icons.broken_image));
              },
            ),
          ),
        ),
        Positioned(
          top: 8.h,
          right: 8.w,
          child: Container(
            height: 20.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: isOpen
                  ? const Color.fromARGB(255, 245, 255, 243)
                  : const Color.fromARGB(255, 255, 243, 243),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(
              isOpen ? "OpenNow" : "Closed",
              style: AppTextStyles.inline.copyWith(
                fontSize: 10.sp,
                color: isOpen ? Colors.green : Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
