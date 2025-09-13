import 'package:flutter/material.dart';

import 'badge_model.dart';

/// A concrete implementation of BottomNavBarItem

class NavBarItem {
  final IconData? icon;
  final String? label;

  /// Optional badge key for reactive badge counts
  final BadgeModel? badge;

  /// Optional active/inactive colors for shifting mode
  final Color? activeColor;
  final Color? inactiveColor;

  const NavBarItem({
    this.icon,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.badge,
  });
}

// class NavBarItem {
//   final IconData icon;
//   final String label;
//   final String badgeKey; // Unique key for badge identification
//   final Color? badgeColor;
//   final Color? labelColor;
//   final TextStyle? labelStyle;
//
//   NavBarItem({
//     required this.icon,
//     required this.label,
//     required this.badgeKey,
//   });
// }
