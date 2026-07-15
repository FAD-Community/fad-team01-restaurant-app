import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class MenuTab extends StatefulWidget {
  const MenuTab({super.key});

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  int _selectedMenuCategoryIndex = 0;

  final List<String> _menuCategories = const ['All', 'Mains', 'Drinks'];

  final List<Map<String, dynamic>> _allMenuItems = const [
    {
      'title': 'Wagyu Ribeye Steak',
      'price': '250',
      'description': 'Grilled wagyu beef served with truffle mashed potatoes and asparagus.',
      'tag': 'POPULAR',
      'category': 'Mains',
    },
    {
      'title': 'Pan-Seared Sea Bass',
      'price': '500',
      'description': 'Fresh sea bass with lemon-herb butter sauce, wild rice, and roasted veggies.',
      'tag': 'NEW',
      'category': 'Mains',
    },
    {
      'title': 'Truffle Tagliatelle',
      'price': '120',
      'description': 'Homemade pasta tossed in creamy parmesan sauce and fresh black truffle.',
      'tag': null,
      'category': 'Mains',
    },
    {
      'title': 'Virgin Mojito',
      'price': '60',
      'description': 'Refreshing mix of lime, mint, simple syrup, and sparkling water.',
      'tag': 'POPULAR',
      'category': 'Drinks',
    },
    {
      'title': 'Iced Latte',
      'price': '75',
      'description': 'Freshly brewed espresso shot over cold milk and ice.',
      'tag': null,
      'category': 'Drinks',
    },
  ];

  Widget _buildMenuCategories() {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _menuCategories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedMenuCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedMenuCategoryIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.darkBackground : const Color(0xffFFF8F6),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected ? Colors.transparent : const Color(0xffE5D6C8),
                  width: 1.w,
                ),
              ),
              child: Center(
                child: Text(
                  _menuCategories[index],
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isSelected ? AppColors.white : AppColors.textDark,
                    fontSize: 15.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuItemCard(Map<String, dynamic> item) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item['title'],
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textDark,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (item['tag'] != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xffFAD7C4),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    item['tag'],
                    style: AppTextStyles.label.copyWith(
                      color: const Color(0xffB9622C),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          Gap(4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                item['price'],
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textDark,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap(4),
              Text(
                'EGP',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Gap(12),
          Text(
            item['description'],
            style: AppTextStyles.body.copyWith(
              color: AppColors.textMuted,
              fontSize: 14.sp,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = _selectedMenuCategoryIndex == 0
        ? _allMenuItems
        : _allMenuItems
            .where((item) => item['category'] == _menuCategories[_selectedMenuCategoryIndex])
            .toList();

    return Container(
      color: AppColors.scaffoldBackground,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMenuCategories(),
          Gap(20),
          ...filteredItems.map((item) => _buildMenuItemCard(item)),
        ],
      ),
    );
  }
}
