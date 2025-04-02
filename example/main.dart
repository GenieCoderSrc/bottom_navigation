import 'package:bottom_navigation/data/models/nav_bar_item.dart';
import 'package:bottom_navigation/view_models/badge_count_cubit.dart';
import 'package:bottom_navigation/view_models/bottom_nav_bar_cubit.dart';
import 'package:bottom_navigation/views/screens/bottom_nav_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bottom_navigation/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => BottomNavBarCubit(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavScaffold(
      navBarItems: [
        NavBarItem(icon: Icons.home, label: 'Home', badgeKey: 'home'),
        NavBarItem(icon: Icons.notifications, label: 'Notifications', badgeKey: 'notifications'),
        NavBarItem(icon: Icons.settings, label: 'Settings', badgeKey: 'settings'),
      ],
      pages: [
        HomePage(),
        NotificationsPage(),
        SettingsPage(),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<BadgeCountCubit>().updateBadgeCount('home', 5);
          },
          child: Text('Set Badge Count for Home'),
        ),
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
            context.read<BadgeCountCubit>().updateBadgeCount('notifications', 10);
          },
          child: Text('Set Badge Count for Notifications'),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<BadgeCountCubit>().updateBadgeCount('settings', 0);
          },
          child: Text('Clear Badge Count for Settings'),
        ),
      ),
    );
  }
}
