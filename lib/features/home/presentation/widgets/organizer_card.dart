import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Organizer profile card
class OrganizerCard extends StatelessWidget {

  const OrganizerCard({
    super.key,
    required this.imageUrl,
    required this.name,
    this.onTap,
  });
  final String imageUrl;
  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: Container(
        width: 196.w,
        height: 267.h,
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Stack(
          children: [
            // Organizer image
            ClipRRect(
              borderRadius: BorderRadius.circular(40.r),
              child: Image.network(
                imageUrl,
                width: 196.w,
                height: 267.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 196.w,
                  height: 267.h,
                  color: context.colors.primary,
                  child: Icon(
                    Icons.person,
                    size: 80.sp,
                    color: Colors.white24,
                  ),
                ),
              ),
            ),
            
            // Name overlay
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                  ),
                ),
                child: AppText.bodyMedium(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  color: context.colors.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
