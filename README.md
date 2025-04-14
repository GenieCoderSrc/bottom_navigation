# bottom_navigation

A customizable and badge-supported bottom navigation bar for Flutter using Bloc state management. This package provides a reusable scaffold (`BottomNavScaffold`) and navigation bar (`CustomBottomNavBar`) with dynamic badge capabilities.

---

## Features

- ✨ Easy setup for BottomNavigationBar
- ⚡ State management with `flutter_bloc`
- 📅 Badge support for each navigation item
- ⚖ Fully customizable colors and styling
- 📊 Decoupled, modular structure

---

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  bottom_navigation: ^0.0.1
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
  NavBarItem(icon: Icons.home, label: 'Home', badgeKey: 'home'),
  NavBarItem(icon: Icons.notifications, label: 'Alerts', badgeKey: 'alerts'),
  NavBarItem(icon: Icons.settings, label: 'Settings', badgeKey: 'settings'),
];
```

### 2. Provide Pages

```dart
final pages = [
  HomePage(),
  AlertsPage(),
  SettingsPage(),
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
    navBarItems: items,
    pages: pages,
    appBar: AppBar(title: Text("Bottom Nav Example")),
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
- Combines `Scaffold`, `BlocBuilder`, and `CustomBottomNavBar`.
- Switches between pages automatically using `BottomNavBarCubit`.

### `NavBarItem`
- Defines each bottom nav item (icon, label, badge key).

### `BadgeCountCubit`
- Manages badge count state by label keys.

### `CustomBottomNavBar`
- Wraps `BottomNavigationBar` and shows badges using `IconWithBadge`.

### `IconWithBadge`
- Wraps an `Icon` widget with a dynamic `AppBadge`.

### `AppBadge`
- Simple, customizable red badge circle showing an integer count.



## Coming Soon
- [ ] Persistent navigation
- [ ] Badge animations
- [ ] Dark mode theming support

---

## Contributing

Pull requests are welcome. Please open issues first to discuss what you would like to change.

---

## License
Let me know if you'd like me to customize this further, add images, or create a working example app for GitHub!


