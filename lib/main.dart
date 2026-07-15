import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_cubit.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LocationCubit()..loadRestaurants()),
          ],

          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: AppTextStyles.bodyFont,
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffFAF3E6)),
              scaffoldBackgroundColor: Color(0xffFAF3E6),
            ),
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRoutes.generateRoute,
          ),
        );
      },
    );
  }
}
