import 'package:bottom_navigation/data/models/nav_bar_item.dart';
import 'package:bottom_navigation/view_models/badge_count_cubit.dart';
import 'package:bottom_navigation/view_models/bottom_nav_bar_cubit.dart';
import 'package:bottom_navigation/views/screens/bottom_nav_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavBarCubit()),
        BlocProvider(create: (_) => BadgeCountCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Styles Example',
        home: BottomNavScaffold(
          navBarItems: navBarItems,
          pages: [HomePage(), NotificationsPage(), SettingsPage()],
        ),
      ),
    );
  }
}

final List<NavBarItem> navBarItems = [
  NavBarItem(icon: Icons.home, label: "Home", badgeKey: "home"),
  NavBarItem(icon: Icons.notifications, label: "Notifications", badgeKey: "notifications"),
  NavBarItem(icon: Icons.settings, label: "Settings", badgeKey: "settings"),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Page")),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Notifications Page"),
            ElevatedButton(
              onPressed: () {
                context.read<BadgeCountCubit>().updateBadgeCount("notifications", 5);
              },
              child: Text("Update Badge"),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Settings Page")),
    );
  }
}
