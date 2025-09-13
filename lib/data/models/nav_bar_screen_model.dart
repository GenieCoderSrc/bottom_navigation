import 'package:flutter/material.dart';

class NavBarScreenModel {
  /// Root builder for the page/tab
  final Widget Function(BuildContext context) builder;

  /// Optional per-page AppBar
  final PreferredSizeWidget? appBar;

  /// Optional per-page FloatingActionButton
  final Widget? fab;

  /// Optional per-page FAB location
  final FloatingActionButtonLocation? fabLocation;

  /// Navigator key for nested navigation
  final GlobalKey<NavigatorState>? navigatorKey;

  /// Optional per-page back button handler
  /// Return `true` to allow pop, `false` to block
  final Future<bool> Function()? onWillPop;

  const NavBarScreenModel({
    required this.builder,
    this.appBar,
    this.fab,
    this.fabLocation,
    this.navigatorKey,
    this.onWillPop,
  });

  bool get hasNestedNavigator => navigatorKey != null;
}
