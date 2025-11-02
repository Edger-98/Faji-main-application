import 'dart:ui';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/presentation/widgets/common/app_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyTicketsScreen extends StatelessWidget {
  const MyTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  // Back button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      color: AppColors.onSurface,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Spacer(),
                  // Title
                  Text(
                    'My Tickets',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: AppTypography.medium,
                    ),
                  ),
                  const Spacer(),
                  // Settings button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.settings_outlined, size: 18),
                      color: AppColors.onSurface,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            // Organize event button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () => context.push(RouteManager.organizeEvent),
                child: Container(
                  height: 69,
                  decoration: BoxDecoration(
                    color: AppColors.searchBarBackground,
                    borderRadius: BorderRadius.circular(37),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 22),
                      Text(
                        'Organize an event',
                        style: AppTypography.bodyLarge.copyWith(
                          color: const Color(0xFFB9B9B9),
                          fontWeight: AppTypography.regular,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 28,
                        height: 28,
                        margin: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.add_circle_outline,
                          color: AppColors.onSurface,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            // Tickets list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildTicketCard(context, isLiked: false),
                  const SizedBox(height: 14),
                  _buildTicketCard(context, isLiked: true),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
    );
  }

  Widget _buildTicketCard(BuildContext context, {required bool isLiked}) {
    return Container(
      height: 267,
      decoration: BoxDecoration(
        color: AppColors.eventCardBlue,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                color: AppColors.eventCardBlue,
              ),
            ),
          ),
          // Gradient overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 88,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.overlayBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GENfest Music Festival 2024 - Multi - \nsensorial Audio Interface',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: AppTypography.regular,
                          fontSize: 15,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            'Wed 22/03',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: AppTypography.regular,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: const BoxDecoration(
                              color: AppColors.dotSeparator,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '08:30 PM',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: AppTypography.regular,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: const BoxDecoration(
                              color: AppColors.dotSeparator,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'From \$40.00',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.primary,
                              fontWeight: AppTypography.regular,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Like button
          Positioned(
            right: 16,
            top: 16,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isLiked ? Colors.black : Colors.black.withOpacity(0.38),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: AppColors.onSurface,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
