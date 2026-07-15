import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
    int selectedindex = 0;

  final List<String> categories = [
    'All',
    'Seafood',
    'Burger',
    'Pizza',
    'Coffee',
  ];
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
                  height: 46.h,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final isSelected = selectedindex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.darkBackground
                                : AppColors.scaffoldBackground,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: AppTextStyles.body.copyWith(
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.textDark,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ;
  }
}