import 'package:bottom_navigation/view_models/badge_count_cubit.dart';
import 'package:bottom_navigation/view_models/bottom_nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_di_global_variable/get_it_di.dart';
import 'package:provider/single_child_widget.dart';

// ---- Bottom Navigation ------
late BadgeCountCubit _badgeCountCubit;
late BottomNavBarCubit _bottomNavBarCubit;

initBottomNavigationBlocProvider() {
  // ---- Bottom Navigation Init ------
  _badgeCountCubit = sl<BadgeCountCubit>();
  _bottomNavBarCubit = sl<BottomNavBarCubit>();
}

disposeBottomNavigationBlocProvider() {
  // ---- Bottom Navigation Dispose ------
  _badgeCountCubit.close();
  _bottomNavBarCubit.close();
}

List<SingleChildWidget> bottomNavigationBlocProviders = [
  // ---- Bottom Navigation Bloc Provider ------
  BlocProvider<BadgeCountCubit>.value(value: _badgeCountCubit),
  BlocProvider<BottomNavBarCubit>(
      create: (BuildContext context) => _bottomNavBarCubit),
];
