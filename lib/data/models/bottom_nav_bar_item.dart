import 'package:flutter/material.dart';

/// Abstract class defining the contract for BottomNavBar items
abstract class BottomNavBarItem {
  IconData get icon;
  String get label;

  int? get badgeCount; // Nullable to handle no badge
}
