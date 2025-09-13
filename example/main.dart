import 'package:bottom_navigation/bottom_navigation.dart';
import 'package:bottom_navigation/data/models/badge_model.dart';
import 'package:bottom_navigation/data/models/nav_bar_item.dart';
import 'package:bottom_navigation/data/models/nav_bar_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavBarCubit()),
        BlocProvider(create: (_) => BadgeCountCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BottomNavScaffold Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Declare navigator keys for tabs that need nested navigation
  final homeNavigatorKey = GlobalKey<NavigatorState>();
  final searchNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final pages = <NavBarScreenModel>[
      // Home tab (nested navigator)
      NavBarScreenModel(
        builder: (_) => Navigator(
          key: homeNavigatorKey,
          onGenerateRoute: (_) =>
              MaterialPageRoute(builder: (_) => const HomePage()),
        ),
        navigatorKey: homeNavigatorKey,
        appBar: AppBar(title: const Text('Home')),
        fab: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('FAB clicked on Home'))),
        ),
      ),

      // Search tab (nested navigator)
      NavBarScreenModel(
        builder: (_) => Navigator(
          key: searchNavigatorKey,
          onGenerateRoute: (_) =>
              MaterialPageRoute(builder: (_) => const SearchPage()),
        ),
        navigatorKey: searchNavigatorKey,
        appBar: AppBar(title: const Text('Search')),
      ),

      // Profile tab (normal page)
      NavBarScreenModel(
        builder: (_) => const ProfilePage(),
        appBar: AppBar(title: const Text('Profile')),
      ),

      // Notification tab (normal page)
      NavBarScreenModel(
        builder: (_) => NotificationsPage(),
        appBar: AppBar(title: const Text('Notification')),
      ),
    ];

    final navItems = [
      NavBarItem(
        icon: Icons.home,
        label: 'Home',
        badge: BadgeModel(badgeKey: 'home', badgeColor: Colors.red),
        activeColor: Colors.blue,
      ),
      NavBarItem(
        icon: Icons.search,
        label: 'Search',
        badge: BadgeModel(badgeKey: 'search', badgeColor: Colors.green),
        activeColor: Colors.green,
      ),
      NavBarItem(
        icon: Icons.person,
        label: 'Profile',
        badge: BadgeModel(badgeKey: 'profile', badgeColor: Colors.purple),
        activeColor: Colors.purple,
      ),
      NavBarItem(
        icon: Icons.notifications,
        label: 'Notification',
        badge:
            BadgeModel(badgeKey: 'notification', badgeColor: Colors.redAccent),
        activeColor: Colors.amber,
      ),
    ];

    return BottomNavScaffold(
      pages: pages,
      navBarItems: navItems,
      preservePageState: true,
      doubleBackToExit: true,
      exitMessage: 'Press back again to exit',
    );
  }
}

// ----------------- Pages -----------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home Page (Nested Navigator)'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const HomeDetailPage()),
              );
            },
            child: const Text('Go to Home Detail'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<BadgeCountCubit>().updateBadgeCount('home', 5);
            },
            child: const Text('Set Badge Count for Home'),
          ),
        ],
      ),
    );
  }
}

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Detail')),
      body: const Center(child: Text('Nested page inside Home')),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<BadgeCountCubit>().updateBadgeCount('search', 3);
        },
        child: const Text('Set Badge Count for Search'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<BadgeCountCubit>().updateBadgeCount('profile', 0);
        },
        child: const Text('Clear Badge Count for Profile'),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context
                .read<BadgeCountCubit>()
                .updateBadgeCount('notifications', 10);
          },
          child: Text('Set Badge Count for Notifications'),
        ),
      ),
    );
  }
}
