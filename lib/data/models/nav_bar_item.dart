import 'package:flutter/material.dart';

/// A concrete implementation of BottomNavBarItem
class NavBarItem {
  final IconData icon;
  final String label;
  final String badgeKey; // Unique key for badge identification

  NavBarItem({
    required this.icon,
    required this.label,
    required this.badgeKey,
  });
}
