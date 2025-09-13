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
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final Color? backgroundColor;
  final BottomNavigationBarType? type;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.backgroundColor,
    this.type,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showSelectedLabels,
    this.showUnselectedLabels,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: backgroundColor ?? theme.bottomAppBarTheme.color,
      selectedItemColor: selectedItemColor ?? theme.primaryColor,
      unselectedItemColor: unselectedItemColor ?? Colors.grey,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      type: type ?? BottomNavigationBarType.fixed,
      items: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;

        return BottomNavigationBarItem(
          icon: BlocBuilder<BadgeCountCubit, Map<String, int>>(
            builder: (context, badgeCounts) {
              final badgeCount = badgeCounts[item.badge?.badgeKey] ?? 0;
              return IconWithBadge(
                icon: item.icon,
                iconColor: currentIndex == index
                    ? item.activeColor
                    : item.inactiveColor,
                badgeCount: badgeCount,
                badgeColor: item.badge?.badgeColor,
                badgeLabelColor: item.badge?.labelColor,
                badgeLabelStyle: item.badge?.labelStyle,
              );
            },
          ),
          label: item.label,
        );
      }).toList(),
    );
  }
}
