import 'package:flutter/material.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

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
                    'Support',
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
            // Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  const SizedBox(height: 17),
                  // Support image
                  Center(
                    child: Container(
                      width: 278,
                      height: 278,
                      decoration: BoxDecoration(
                        color: AppColors.searchBarBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Title
                  Center(
                    child: Text(
                      'Hello, how can we\nhelp you?',
                      textAlign: TextAlign.center,
                      style: AppTypography.displaySmall.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: AppTypography.medium,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 61),
                  // Contact live chat
                  _buildSupportOption('Contact live chat'),
                  const SizedBox(height: 17),
                  // Send us an email
                  _buildSupportOption('Send us an email'),
                  const SizedBox(height: 17),
                  // FAQs
                  _buildSupportOption('FAQs'),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption(String title) {
    return Container(
      height: 69,
      padding: const EdgeInsets.symmetric(horizontal: 27),
      decoration: BoxDecoration(
        color: AppColors.searchBarBackground,
        borderRadius: BorderRadius.circular(34.5),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.onSurface,
              fontWeight: AppTypography.thin,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.onSurface,
            size: 10,
          ),
        ],
      ),
    );
  }
}
