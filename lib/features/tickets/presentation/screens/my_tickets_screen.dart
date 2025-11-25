import 'dart:ui';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/presentation/widgets/common/app_bottom_nav.dart';
import 'package:fajimobileapp/presentation/widgets/common/empty_state.dart';
import 'package:fajimobileapp/presentation/widgets/common/animated_button.dart';
import 'package:fajimobileapp/presentation/widgets/common/event_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  List<String> _tickets = ['ticket1', 'ticket2']; // Mock data
  bool _isLoading = false;

  Future<void> _refreshTickets() async {
    HapticFeedback.lightImpact();
    setState(() => _isLoading = true);
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
  }

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
              child: AnimatedButton(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  context.push(RouteManager.eventCreationFlow);
                },
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
              child: _isLoading
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: index < 2 ? 14 : 0),
                        child: const TicketCardShimmer(),
                      ),
                    )
                  : _tickets.isEmpty
                      ? EmptyState(
                          icon: Icons.confirmation_number_outlined,
                          title: 'No tickets yet',
                          message: 'Your purchased tickets will appear here',
                        )
                      : RefreshIndicator(
                      onRefresh: _refreshTickets,
                      color: AppColors.primary,
                      backgroundColor: AppColors.surfaceContainerHighest,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: _tickets.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: index < _tickets.length - 1 ? 14 : 0,
                            ),
                            child: _buildTicketCard(context, isLiked: index == 1),
                          );
                        },
                      ),
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
            child: AnimatedButton(
              onTap: () {
                HapticFeedback.mediumImpact();
                // Toggle favorite
              },
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
          ),
        ],
      ),
    );
  }
}
