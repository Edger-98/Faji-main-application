import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      margin: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.bottomNavBackground,
        borderRadius: BorderRadius.circular(44),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(44),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(
                context,
                icon: Icons.home,
                index: 0,
                route: RouteManager.home,
              ),
              // Favorites removed - feature disabled
              // _buildNavItem(
              //   context,
              //   icon: Icons.favorite_border,
              //   index: 1,
              //   route: RouteManager.favorites,
              // ),
              _buildNavItem(
                context,
                icon: Icons.confirmation_number_outlined,
                index: 1, // Changed from 2 to 1
                route: RouteManager.myTickets,
              ),
              _buildNavItem(
                context,
                icon: Icons.person_outline,
                index: 2, // Changed from 3 to 2
                route: RouteManager.profile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required int index,
    required String route,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          context.go(route);
        }
      },
      child: Container(
        width: 81,
        height: 81,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? AppColors.background : AppColors.onSurface,
          size: 24,
        ),
      ),
    );
  }
}
