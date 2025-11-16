import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/presentation/widgets/common/app_bottom_nav.dart';
import 'package:fajimobileapp/presentation/widgets/common/empty_state.dart';
import 'package:fajimobileapp/presentation/widgets/common/animated_button.dart';
import 'package:fajimobileapp/presentation/widgets/common/event_card_shimmer.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool _showEvents = true;
  bool _isLoading = false;
  List<String> _favoriteEvents = ['event1', 'event2']; // Mock data

  Future<void> _refreshFavorites() async {
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
                    'Favorites',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: AppTypography.medium,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 50),
                ],
              ),
            ),
            const SizedBox(height: 6),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 69,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: AppColors.searchBarBackground,
                  borderRadius: BorderRadius.circular(34.5),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.onSurfaceVariant,
                      size: 18,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Search your favorites',
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontWeight: AppTypography.thin,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Filter tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _buildFilterChip('Events', _showEvents, () {
                    setState(() => _showEvents = true);
                  }),
                  const SizedBox(width: 6),
                  _buildFilterChip('Organizer', !_showEvents, () {
                    setState(() => _showEvents = false);
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Events list
            Expanded(
              child: _isLoading
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: index < 2 ? 14 : 0),
                        child: const EventCardShimmer(),
                      ),
                    )
                  : _favoriteEvents.isEmpty
                      ? EmptyState(
                          icon: Icons.favorite_border,
                          title: 'No favorites yet',
                          message: 'Events you favorite will appear here',
                        )
                      : RefreshIndicator(
                      onRefresh: _refreshFavorites,
                      color: AppColors.primary,
                      backgroundColor: AppColors.surfaceContainerHighest,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: _favoriteEvents.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: index < _favoriteEvents.length - 1 ? 14 : 0,
                            ),
                            child: _buildEventCard(context, isLive: true),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 33,
        padding: const EdgeInsets.symmetric(horizontal: 21),
        decoration: BoxDecoration(
          color: AppColors.categoryChipBackground,
          borderRadius: BorderRadius.circular(34.5),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTypography.bodyLarge.copyWith(
              color: isSelected ? AppColors.primary : AppColors.textTertiary,
              fontWeight: AppTypography.regular,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, {required bool isLive}) {
    return Container(
      height: 295,
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
          // Live badge
          if (isLive)
            Positioned(
              left: 30,
              top: 17,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.liveRed,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Live',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: AppTypography.regular,
                  ),
                ),
              ),
            ),
          // Like button
          Positioned(
            right: 16,
            top: 17,
            child: AnimatedButton(
              onTap: () {
                HapticFeedback.mediumImpact();
                // Remove from favorites
              },
              child: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0x351F1F1F),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite,
                  color: AppColors.onSurface,
                  size: 18,
                ),
              ),
            ),
          ),
          // Gradient overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 97,
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                      const SizedBox(height: 7),
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
        ],
      ),
    );
  }
}
