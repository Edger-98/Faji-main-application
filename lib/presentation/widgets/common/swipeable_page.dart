import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

/// Wrapper that adds swipe-to-go-back gesture
class SwipeablePage extends StatelessWidget {
  final Widget child;
  final bool canSwipeBack;

  const SwipeablePage({
    super.key,
    required this.child,
    this.canSwipeBack = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!canSwipeBack) return child;

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Swipe from left to right
        if (details.primaryVelocity! > 300) {
          HapticFeedback.lightImpact();
          if (context.canPop()) {
            context.pop();
          }
        }
      },
      child: child,
    );
  }
}
