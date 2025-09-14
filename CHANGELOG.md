# Changelog

All notable changes to this project will be documented in this file.

## 0.0.9

### Sep 14, 2025

### ✨ Fixed

- Resolved app hang issue on back press in `BackHandler`.

## 0.0.8

### Sep 13, 2025

### ✨ Refactor

- Re-named `NavPageConfig` to `NavBarScreenModel`

## 0.0.7

### Sep 13, 2025

### ✨ Created

- ✅ Added BottomNavScaffold with `per-page` `AppBar`, `FAB`, `nested navigators`, and optional custom bottom bar.

- ✅ Added `preservePageState` for tab state retention using `IndexedStack`.

- ✅ Integrated PopScope with `onPopInvokedWithResult`, `double back-to-exit`, and `switch-to-first-tab` support.

- ✅ Updated ``CustomBottomNavBar`` with `badges`, `per-tab colors`, `label styles`, and `BottomNavigationBarType`.

- ✅ Refactored `NavBarItem` and `NavPageConfig` for better customization and page-level back handling

## 0.0.6

### Aug 22, 2025

### ✨ Updated

- Updated provider to 6.1.5+1
- Updated Dart sdk to 3.9.0
- Removed `flutter_lints` Dependency

## 0.0.5

### Added

- Implemented BlocProvider
- Implemented Get It DI
- Use `provider` 6.1.5

## 0.0.4

### Added

- package version update

## 0.0.3

### Added

- ✅ Provided full customization options for colors and structure.

## 0.0.2

### Added

- ✅ Introduced a reusable `BottomNavScaffold` widget for easy integration of a bottom navigation bar.
- ✅ Added `NavBarItem` model to define items in the bottom navigation bar.
- ✅ Implemented `BadgeCountCubit` to manage and update badge counts dynamically.
- ✅ Created `CustomBottomNavBar` widget with badge support for each navigation item.
- ✅ Added `AppBadge` widget for displaying badges with customizable colors and sizes.
- ✅ Integrated `flutter_bloc` for managing navigation index and badge counts.
- ✅ Provided an example of how to use the package with a bottom navigation setup.

## 0.0.1

- ✅ Initial Release.
