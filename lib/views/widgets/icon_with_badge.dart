import 'package:bottom_navigation/views/widgets/app_badge.dart';
import 'package:flutter/material.dart';
// import 'badge_widget.dart';

/// A reusable widget that combines an icon with an optional badge.
class IconWithBadge extends StatelessWidget {
  final IconData icon;
  final int? badgeCount;
  final double iconSize;
  final Color? iconColor;

  const IconWithBadge({
    super.key,
    required this.icon,
    this.badgeCount,
    this.iconSize = 24.0,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return badgeCount != null && badgeCount! > 0
        ? Stack(
            clipBehavior: Clip.none,
            children: [
              _buildIcon(),
              Positioned(
                top: -4,
                right: -4,
                child: AppBadge(count: badgeCount),
              ),
            ],
          )
        : _buildIcon();
  }

  Widget _buildIcon() {
    return Icon(
      icon,
      size: iconSize,
      color: iconColor,
    );
  }
}
