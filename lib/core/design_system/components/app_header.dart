import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/typography/app_typography.dart';
import 'package:fajimobileapp/core/design_system/extensions/context_extensions.dart';

/// Standardized header component for all main tabs
/// Ensures consistent UX across Home, Vendors, Events, Wallet, Profile
class AppHeader extends StatelessWidget {

  const AppHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
  });
  final String title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 16.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.headlineLarge.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 8.h),
                  Text(
                    subtitle!,
                    style: AppTypography.bodyMedium.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
}
