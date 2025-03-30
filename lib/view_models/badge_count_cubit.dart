import 'package:flutter_bloc/flutter_bloc.dart';

/// A Cubit that manages badge counts for different items.
class BadgeCountCubit extends Cubit<Map<String, int>> {
  BadgeCountCubit() : super({});

  /// Update the badge count for a specific item (identified by its label)
  void updateBadgeCount(String label, int count) {
    final updatedCounts = Map<String, int>.from(state);
    updatedCounts[label] = count;
    emit(updatedCounts);
  }

  /// Get the badge count for a specific item by its label
  int getBadgeCount(String label) {
    return state[label] ?? 0; // Return 0 if no count is set
  }
}