import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/search/cubit/search_cubit.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_cubit.dart';

void main() {
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (_) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LocationCubit>(
              create: (_) => LocationCubit()..loadRestaurants(),
            ),

            BlocProvider<SearchCubit<RestaurantEntity>>(
              create: (_) => SearchCubit<RestaurantEntity>(),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: AppTextStyles.bodyFont,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xffFAF3E6),
              ),
              scaffoldBackgroundColor: const Color(0xffFAF3E6),
            ),
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        );
      },
    );
  }
}
