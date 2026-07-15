import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/widgets/search/cubit/search_cubit.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_cubit.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_state.dart';
import 'package:ka3da/features/nearby/presentation/widgets/location_dialog.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        try {
          final locationCubit = context.read<LocationCubit>();

          await locationCubit.getCurrentLocation();

          context.read<SearchCubit<RestaurantEntity>>().filter(
            locationCubit.state.restaurants,
          );
        } catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));

          if (!context.mounted) return;

          final error = e.toString();

          if (error.contains("SERVICE_DISABLED")) {
            final open = await LocationDialog.show(
              context,
              title: "Location Disabled",
              message: "Please enable location services to continue.",
            );

            if (open == true) {
              await Geolocator.openLocationSettings();
            }
          } else if (error.contains("PERMISSION_DENIED_FOREVER")) {
            final open = await LocationDialog.show(
              context,
              title: "Permission Required",
              message:
                  "Location permission is permanently denied.\nPlease enable it from App Settings.",
            );

            if (open == true) {
              await Geolocator.openAppSettings();
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Unable to get your current location."),
              ),
            );
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 22.w,
        height: 22.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.accent, width: .6),
          borderRadius: BorderRadius.circular(100),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state.isLoadingLocation) {
              return SizedBox(
                width: 14.w,
                height: 14.h,
                child: const CircularProgressIndicator(strokeWidth: 2),
              );
            }

            return SvgPicture.asset(
              "assets/nearby/fluent_my-location-20-regular.svg",
              width: 17.w,
              height: 17.h,
            );
          },
        ),
      ),
    );
  }
}
