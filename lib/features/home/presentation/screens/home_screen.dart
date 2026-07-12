import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/home/presentation/widgets/actions_buttons.dart';
import 'package:ka3da/features/home/presentation/widgets/categories_widget.dart';
import 'package:ka3da/features/home/presentation/widgets/greating_widget.dart';
import 'package:ka3da/features/home/presentation/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.white,
            toolbarHeight: 225,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    GreetingAppbar(),
                  
                  
                    ActionsButtons(),
                  ],
                ),
                Gap(14),
                SearchBarWidgets(),
                Gap(14),
              CategoriesWidget(),
                Gap(5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




