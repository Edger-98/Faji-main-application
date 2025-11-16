import 'package:flutter/material.dart';

/// Wrapper for event cards to enable hero animations
class HeroEventCard extends StatelessWidget {
  final String heroTag;
  final Widget child;

  const HeroEventCard({
    super.key,
    required this.heroTag,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
