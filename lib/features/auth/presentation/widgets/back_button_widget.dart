import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Back button component matching Figma design system
class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w, // Responsive width
      height: 50.h, // Responsive height
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: onPressed ?? () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.goNamed(RouteManager.introName);
            }
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: context.colors.onSurface,
            size: 16,
          ),
        ),
      ),
    );
  }
}