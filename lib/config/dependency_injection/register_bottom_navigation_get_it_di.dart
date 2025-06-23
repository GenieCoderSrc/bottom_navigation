import 'package:bottom_navigation/view_models/badge_count_cubit.dart';
import 'package:bottom_navigation/view_models/bottom_nav_bar_cubit.dart';
import 'package:get_it_di_global_variable/get_it_di.dart';

registerBottomNavigationGetItDI() {
  /// ----------------- Bottom Navigation ------------------

  // View Models
  sl.registerFactory<BadgeCountCubit>(() => BadgeCountCubit());
  sl.registerFactory<BottomNavBarCubit>(() => BottomNavBarCubit());
}
