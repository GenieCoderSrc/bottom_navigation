import 'package:bottom_navigation/data/models/nav_bar_item.dart';
import 'package:bottom_navigation/view_models/bottom_nav_bar_cubit.dart';
import 'package:bottom_navigation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A reusable scaffold for Bottom Navigation Bar layouts
class BottomNavScaffold extends StatelessWidget {
  final List<NavBarItem> navBarItems;
  final List<Widget> pages;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;

  const BottomNavScaffold({
    super.key,
    required this.navBarItems,
    required this.pages,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.backgroundColor,
    this.appBar,
    this.drawer,
    // this.bottomNavigationBarType,
  }) : assert(navBarItems.length == pages.length,
            'The number of navBarItems and pages must be equal');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, state) {
          return pages[state];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, state) {
          return CustomBottomNavBar(
            items: navBarItems,
            currentIndex: state,
            onTap: (index) =>
                context.read<BottomNavBarCubit>().updateIndex(index),
            selectedItemColor: selectedItemColor,
            unselectedItemColor: unselectedItemColor,
            backgroundColor: backgroundColor,
          );
        },
      ),
    );
  }
}
