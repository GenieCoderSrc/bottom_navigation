import 'package:flutter/material.dart';

/// A simple badge widget to display counts.
class AppBadge extends StatelessWidget {
  final int? count;
  final Color? color;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final double size;

  const AppBadge({
    super.key,
    required this.count,
    this.color,
    this.labelColor,
    this.labelStyle,
    this.size = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    if (count == null || count! <= 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color ?? Colors.red,
        borderRadius: BorderRadius.circular(size),
      ),
      constraints: BoxConstraints(
        minWidth: size,
        minHeight: size,
      ),
      child: Center(
        child: Text(
          count!.toString(),
          style: labelStyle ??
              TextStyle(
                color: labelColor ?? Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
