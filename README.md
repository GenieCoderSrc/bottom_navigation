# styles

A Flutter package providing a customizable bottom navigation bar with badge support using Flutter Bloc.

## Features
- Custom bottom navigation bar with icon and label support
- Badge functionality for navigation items
- State management using Flutter Bloc
- Reusable components for consistent UI design

## Installation
Add the following dependency in your `pubspec.yaml`:

```yaml
dependencies:
  styles: latest_version
```

Then, run:
```sh
flutter pub get
```

## Usage
### Import the package:
```dart
import 'package:styles/styles.dart';
```

### Define Navigation Items:
```dart
List<NavBarItem> navBarItems = [
  NavBarItem(icon: Icons.home, label: 'Home', badgeKey: 'home'),
  NavBarItem(icon: Icons.notifications, label: 'Notifications', badgeKey: 'notifications'),
  NavBarItem(icon: Icons.settings, label: 'Settings', badgeKey: 'settings'),
];
```

### Implement `BottomNavScaffold`:
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavBarCubit()),
        BlocProvider(create: (_) => BadgeCountCubit()),
      ],
      child: MaterialApp(
        home: BottomNavScaffold(
          navBarItems: navBarItems,
          pages: [HomePage(), NotificationsPage(), SettingsPage()],
        ),
      ),
    );
  }
}
```

### Updating Badge Count:
```dart
context.read<BadgeCountCubit>().updateBadgeCount('notifications', 5);
```

## Example
For a complete implementation, check the `example/` directory.

## License
MIT License. See `LICENSE` file for details.

