import 'package:flutter/material.dart';

/// Wrapper for event cards to enable hero animations
class HeroEventCard extends StatelessWidget {

  const HeroEventCard({
    super.key,
    required this.heroTag,
    required this.child,
  });
  final String heroTag;
  final Widget child;

  @override
  Widget build(BuildContext context) => Hero(
      tag: heroTag,
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
}
