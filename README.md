# bottom_navigation

A customizable and badge-supported bottom navigation bar for Flutter using Bloc state management. This package provides a reusable scaffold (`BottomNavScaffold`) and navigation bar (`CustomBottomNavBar`) with dynamic badge capabilities, supporting nested navigators and per-page AppBar/FAB.

---

## Features

* ✨ Easy setup for BottomNavigationBar
* ⚡ State management with `flutter_bloc`
* 📅 Badge support for each navigation item
* 🏗 Nested navigator support per tab
* ⚖ Fully customizable colors, styles, and FABs
* 📊 Decoupled, modular structure

---

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  bottom_navigation: <latest_version>
```

Then run:

```bash
flutter pub get
```

---

## Usage

### 1. Create NavBar Items

```dart
final items = [
  NavBarItem(icon: Icons.home, label: 'Home', badge: BadgeModel(badgeKey: 'home')),
  NavBarItem(icon: Icons.notifications, label: 'Alerts', badge: BadgeModel(badgeKey: 'alerts')),
  NavBarItem(icon: Icons.settings, label: 'Settings', badge: BadgeModel(badgeKey: 'settings')),
];
```

### 2. Provide Pages (Normal or Nested Navigator)

```dart
final pages = [
  NavPageConfig(
    builder: (_) => HomePage(),
    appBar: AppBar(title: Text('Home')),
    fab: FloatingActionButton(onPressed: () {}),
    navigatorKey: GlobalKey<NavigatorState>(), // optional for nested navigation
  ),
  NavPageConfig(builder: (_) => AlertsPage(), appBar: AppBar(title: Text('Alerts'))),
  NavPageConfig(builder: (_) => SettingsPage(), appBar: AppBar(title: Text('Settings'))),
];
```

### 3. Wrap Your App with BlocProviders

```dart
MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => BottomNavBarCubit()),
    BlocProvider(create: (_) => BadgeCountCubit()),
  ],
  child: BottomNavScaffold(
    pages: pages,
    navBarItems: items,
    preservePageState: true, // optional, default true
    doubleBackToExit: true,  // optional
    exitMessage: 'Press back again to exit',
  ),
);
```

### 4. Update Badge Count

```dart
context.read<BadgeCountCubit>().updateBadgeCount('alerts', 3);
```

---

## Components

### `BottomNavScaffold`

* Combines `Scaffold`, `BlocBuilder`, and `CustomBottomNavBar`.
* Switches between pages automatically using `BottomNavBarCubit`.
* Supports nested navigators per tab, FAB, AppBar, and back handling.

### `NavPageConfig`

* Defines each page/tab configuration.
* Supports `builder`, `appBar`, `fab`, `fabLocation`, `navigatorKey`, and per-page `onWillPop`.

### `NavBarItem`

* Defines each bottom nav item (icon, label, optional badge, active/inactive colors).

### `BadgeModel`

* Defines badge key and optional badge colors and label style.

### `BadgeCountCubit`

* Manages badge count state by label keys.

### `CustomBottomNavBar`

* Wraps `BottomNavigationBar` and shows badges using `IconWithBadge`.

### `IconWithBadge`

* Wraps an `Icon` widget with a dynamic `AppBadge`.

### `AppBadge`

* Simple, customizable badge showing an integer count.

---

## Coming Soon

* [ ] Badge animations
* [ ] Additional bottom nav customization

---

## Contributing

Pull requests are welcome. Please open issues first to discuss what you would like to change.

---

## License

© MIT License. Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)

