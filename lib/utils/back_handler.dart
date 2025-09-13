import 'package:bottom_navigation/data/models/nav_bar_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_models/bottom_nav_bar_cubit.dart';

class BackHandler {
  /// Tracks last back press time per context for double back exit
  static DateTime? _lastBackPress;

  /// Double back exit logic
  static Future<bool> checkDoubleBackExit(
      BuildContext context, Duration timeout, String? message) async {
    final now = DateTime.now();
    if (_lastBackPress == null || now.difference(_lastBackPress!) > timeout) {
      _lastBackPress = now;

      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), duration: timeout),
        );
      }
      return false; // prevent exit
    }
    return true; // allow exit
  }

  /// Main back handler for BottomNavScaffold
  static Future<void> handleBackPress({
    required BuildContext context,
    required int currentIndex,
    required List<NavBarScreenModel> pages,
    Future<bool> Function()? globalOnWillPop,
    bool switchToFirstTabOnBack = true,
    bool doubleBackToExit = false,
    Duration exitTimeout = const Duration(seconds: 2),
    String? exitMessage,
  }) async {
    final page = pages[currentIndex];

    // 1. Page-level handler
    if (page.onWillPop != null) {
      final allow = await page.onWillPop!();
      if (allow) Navigator.of(context).maybePop();
      return;
    }

    // 2. Global handler
    if (globalOnWillPop != null) {
      final allow = await globalOnWillPop();
      if (allow) Navigator.of(context).maybePop();
      return;
    }

    // 3. Nested navigator
    if (page.hasNestedNavigator) {
      final currentNavigator = page.navigatorKey!.currentState;
      if (currentNavigator != null && currentNavigator.canPop()) {
        currentNavigator.pop();
        return;
      }
    }

    // 4. Switch to first tab
    if (switchToFirstTabOnBack && currentIndex != 0) {
      context.read<BottomNavBarCubit>().updateIndex(0);
      return;
    }

    // 5. Double back to exit
    if (doubleBackToExit) {
      final allow =
          await checkDoubleBackExit(context, exitTimeout, exitMessage);
      if (!allow) return;
    }

    // 6. Default → exit
    Navigator.of(context).maybePop();
  }
}
