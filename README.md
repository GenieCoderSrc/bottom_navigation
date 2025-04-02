# bottom_navigation

A Flutter package that provides a reusable and customizable bottom navigation bar with badge support. Ideal for apps that require a dynamic bottom navigation bar with items that may have badges (e.g., unread notifications).

## Features

- **Customizable Bottom Navigation Bar**: Allows users to define their own navigation items with icons and labels.
- **Badge Support**: Add a badge to each bottom navigation item, useful for notifications, unread messages, or other indicators.
- **Bloc-based State Management**: Uses the `flutter_bloc` package to manage navigation index and badge counts.
- **Easy Integration**: Simple API to use the package in any Flutter app.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  bottom_navigation: ^1.0.0 # Check for the latest version on pub.dev
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


### Key Points:

1. **Installation**: Clear steps to add the package to `pubspec.yaml`.
2. **Usage**: Basic examples of how to use `BottomNavScaffold`, `BadgeCountCubit`, `CustomBottomNavBar`, and `AppBadge`.
3. **Customizations**: Shows how users can customize the navigation bar and badge behavior.
4. **License**: Mentions the MIT license (adjust if you're using a different license).

This should help users understand how to integrate and use the package in their own projects. Let me know if you'd like to add or change anything!


## Example
For a complete implementation, check the `example/` directory.

## License
MIT License. See `LICENSE` file for details.

