import 'package:bottom_navigation/data/models/nav_bar_item.dart';
import 'package:bottom_navigation/view_models/badge_count_cubit.dart';
import 'package:bottom_navigation/views/widgets/icon_with_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Reusable Bottom Navigation Bar widget
class CustomBottomNavBar extends StatelessWidget {
  final List<NavBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? backgroundColor;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor:
          backgroundColor ?? Theme.of(context).bottomAppBarTheme.color,
      selectedItemColor: selectedItemColor ?? Theme.of(context).primaryColor,
      unselectedItemColor: unselectedItemColor ?? Colors.grey,
      items: items.map((item) {
        return BottomNavigationBarItem(
          icon: BlocBuilder<BadgeCountCubit, Map<String, int>>(
            builder: (context, badgeCounts) {
              final badgeCount = badgeCounts[item.badgeKey] ?? 0;
              return IconWithBadge(
                icon: item.icon,
                badgeCount: badgeCount,
              );
            },
          ),
          label: item.label,
        );
      }).toList(),
    );
  }
}
