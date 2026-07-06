import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ka3da/features/layout/presentation/widget/navigation_controller.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'package:ka3da/features/home/presentation/screens/home_screen.dart';
import 'package:ka3da/features/search/presentation/screens/discover_screen.dart';
import 'package:ka3da/features/reservation/presentation/screens/bookings_screen.dart';
import 'package:ka3da/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/profile/profile_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final PersistentTabController _controller = NavigationController.controller;

  List<PersistentTabConfig> _tabs() {
    return [
      PersistentTabConfig(
        screen: const HomeScreen(),
        item: ItemConfig(
          title: "Home",
          activeColorSecondary: const Color(0xffAE292E).withValues(alpha: 0.2),
          activeForegroundColor: const Color.fromARGB(255, 0, 0, 0),
          icon: SvgPicture.asset(
            "assets/nav_bar/home.svg",
            colorFilter: ColorFilter.mode(Color(0xffAE292E), BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/nav_bar/home.svg",
            colorFilter: ColorFilter.mode(
              Color(0xffAE292E).withValues(alpha: 0.4),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      PersistentTabConfig(
        screen: const DiscoverScreen(),
        item: ItemConfig(
          title: "Discover",
          activeColorSecondary: const Color(0xffAE292E).withValues(alpha: 0.2),
          activeForegroundColor: const Color.fromARGB(255, 0, 0, 0),
          icon: SvgPicture.asset(
            "assets/nav_bar/search.svg",
            colorFilter: ColorFilter.mode(Color(0xffAE292E), BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/nav_bar/search.svg",
            colorFilter: ColorFilter.mode(
              Color(0xffAE292E).withValues(alpha: 0.4),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      PersistentTabConfig(
        screen: const BookingsScreen(),
        item: ItemConfig(
          title: "Bookings",
          activeColorSecondary: const Color(0xffAE292E).withValues(alpha: 0.2),
          activeForegroundColor: const Color.fromARGB(255, 0, 0, 0),
          icon: SvgPicture.asset(
            "assets/nav_bar/proicons_calendar.svg",
            colorFilter: ColorFilter.mode(Color(0xffAE292E), BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/nav_bar/proicons_calendar.svg",
            colorFilter: ColorFilter.mode(
              Color(0xffAE292E).withValues(alpha: 0.4),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      PersistentTabConfig(
        screen: const FavoritesScreen(),
        item: ItemConfig(
          title: "Favorites",
          activeColorSecondary: const Color(0xffAE292E).withValues(alpha: 0.2),
          activeForegroundColor: const Color.fromARGB(255, 0, 0, 0),
          icon: SvgPicture.asset(
            "assets/nav_bar/HeartStraight.svg",
            colorFilter: ColorFilter.mode(Color(0xffAE292E), BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/nav_bar/HeartStraight.svg",
            colorFilter: ColorFilter.mode(
              Color(0xffAE292E).withValues(alpha: 0.4),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      PersistentTabConfig(
        screen: const ProfileScreen(),
        item: ItemConfig(
          title: "Profile",
          activeColorSecondary: const Color(0xffAE292E).withValues(alpha: 0.2),
          activeForegroundColor: const Color.fromARGB(255, 0, 0, 0),
          icon: SvgPicture.asset(
            "assets/nav_bar/User.svg",
            colorFilter: ColorFilter.mode(Color(0xffAE292E), BlendMode.srcIn),
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/nav_bar/User.svg",
            colorFilter: ColorFilter.mode(
              Color(0xffAE292E).withValues(alpha: 0.4),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) =>
          Style2BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}
