import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'package:ka3da/features/home/presentation/screens/home_screen.dart';
import 'package:ka3da/features/search/presentation/screens/discover_screen.dart';
import 'package:ka3da/features/reservation/presentation/screens/bookings_screen.dart';
import 'package:ka3da/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/profile_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<PersistentTabConfig> _tabs() {
    return [
      PersistentTabConfig(
        screen: const HomeScreen(),
        item: ItemConfig(
          icon: const Icon(Icons.home),
          title: "Home",
          activeForegroundColor: Colors.deepOrange,
          inactiveForegroundColor: Colors.grey,
        ),
      ),
      PersistentTabConfig(
        screen: const DiscoverScreen(),
        item: ItemConfig(
          icon: const Icon(Icons.search),
          title: "Discover",
          activeForegroundColor: Colors.deepOrange,
          inactiveForegroundColor: Colors.grey,
        ),
      ),
      PersistentTabConfig(
        screen: const BookingsScreen(),
        item: ItemConfig(
          icon: const Icon(Icons.calendar_today),
          title: "Bookings",
          activeForegroundColor: Colors.deepOrange,
          inactiveForegroundColor: Colors.grey,
        ),
      ),
      PersistentTabConfig(
        screen: const FavoritesScreen(),
        item: ItemConfig(
          icon: const Icon(Icons.favorite),
          title: "Favorites",
          activeForegroundColor: Colors.deepOrange,
          inactiveForegroundColor: Colors.grey,
        ),
      ),
      PersistentTabConfig(
        screen: const ProfileScreen(),
        item: ItemConfig(
          icon: const Icon(Icons.person),
          title: "Profile",
          activeForegroundColor: Colors.deepOrange,
          inactiveForegroundColor: Colors.grey,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style2BottomNavBar(
        navBarConfig: navBarConfig,
      ),
    );
  }
}
