import 'package:bottom_navigation/data/models/nav_bar_item.dart';
import 'package:bottom_navigation/utils/back_handler.dart';
import 'package:bottom_navigation/view_models/bottom_nav_bar_cubit.dart';
import 'package:bottom_navigation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:bottom_navigation/data/models/nav_page_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavScaffold extends StatelessWidget {
  /// Pages to show in each tab
  final List<NavPageConfig> pages;

  /// Default nav items (used if [bottomNavigationBar] is null)
  final List<NavBarItem>? navBarItems;

  /// Optional user-provided bottomNavigationBar
  final Widget? bottomNavigationBar;

  /// Colors and style
  final Color? backgroundColor;
  final BottomNavigationBarType navBarType;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;

  /// Scaffold properties
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;

  /// Back handling
  final Future<bool> Function()? onWillPop;
  final bool switchToFirstTabOnBack;
  final bool doubleBackToExit;
  final Duration exitTimeout;
  final String? exitMessage;

  /// Preserve state across tabs
  final bool preservePageState;

  const BottomNavScaffold({
    super.key,
    required this.pages,
    this.navBarItems,
    this.bottomNavigationBar,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.backgroundColor,
    this.navBarType = BottomNavigationBarType.fixed,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.onWillPop,
    this.switchToFirstTabOnBack = true,
    this.doubleBackToExit = false,
    this.exitTimeout = const Duration(seconds: 2),
    this.exitMessage,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.preservePageState = true,
  }) : assert(
          bottomNavigationBar != null || navBarItems != null,
          'Either navBarItems or bottomNavigationBar must be provided',
        );

  /// Helper to render a page (handles nested navigator)
  Widget _buildPage(BuildContext context, NavPageConfig page) {
    if (page.hasNestedNavigator) {
      return Navigator(
        key: page.navigatorKey,
        onGenerateRoute: (_) =>
            MaterialPageRoute(builder: (ctx) => page.builder(ctx)),
      );
    }
    return page.builder(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, index) {
        final page = pages[index];

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) async {
            if (!didPop) {
              await BackHandler.handleBackPress(
                context: context,
                currentIndex: index,
                pages: pages,
                globalOnWillPop: onWillPop,
                switchToFirstTabOnBack: switchToFirstTabOnBack,
                doubleBackToExit: doubleBackToExit,
                exitTimeout: exitTimeout,
                exitMessage: exitMessage,
              );
            }
          },
          child: Scaffold(
            drawer: drawer,
            appBar: page.appBar ?? appBar,
            body: preservePageState
                ? IndexedStack(
                    index: index,
                    children: pages.map((p) => _buildPage(context, p)).toList(),
                  )
                : _buildPage(context, page),
            floatingActionButton: page.fab ?? floatingActionButton,
            floatingActionButtonLocation:
                page.fabLocation ?? floatingActionButtonLocation,

            // Bottom navigation bar (custom or default)
            bottomNavigationBar: bottomNavigationBar ??
                CustomBottomNavBar(
                  items: navBarItems!,
                  currentIndex: index,
                  onTap: (newIndex) =>
                      context.read<BottomNavBarCubit>().updateIndex(newIndex),
                  selectedItemColor: selectedItemColor,
                  unselectedItemColor: unselectedItemColor,
                  selectedLabelStyle: selectedLabelStyle,
                  unselectedLabelStyle: unselectedLabelStyle,
                  showSelectedLabels: showSelectedLabels,
                  showUnselectedLabels: showUnselectedLabels,
                  backgroundColor: backgroundColor,
                  type: navBarType,
                ),
          ),
        );
      },
    );
  }
}
