import 'package:flutter/material.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
                  // Help button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '?',
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: AppTypography.regular,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  const SizedBox(height: 38),
                  // Title
                  Text(
                    'Terms & Conditions',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: AppTypography.medium,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Last updated
                  Text(
                    'Last updated Mar 10, 2024',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: AppTypography.thin,
                    ),
                  ),
                  const SizedBox(height: 37),
                  // Introduction
                  _buildParagraph(
                    'Repellat eos fuga eveniet. Inventore aperiam expedita vero a iusto eveniet qui. Et libero ipsa ut velit nobis. Est animi earum eveniet atque velit. Est voluptatum rerum maxime odit nesciunt ipsum inventore molestiae inventore. Blanditiis eos ut.',
                  ),
                  const SizedBox(height: 32),
                  // Section 1
                  _buildSectionTitle('1 - Conditions of use'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'Repellat eos fuga eveniet. Inventore aperiam expedita vero a iusto eveniet qui. Et libero ipsa ut velit nobis. Est animi earum eveniet atque velit. Est voluptatum rerum maxime odit nesciunt ipsum inventore molestiae inventore. Blanditiis eos ut. eos fuga eveniet. Inventore aperiam expedita vero a usto eveniet qui. Et eveniet atque velit.',
                  ),
                  const SizedBox(height: 32),
                  // Section 2
                  _buildSectionTitle('2 - Privacy Policy'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'Repellat eos fuga eveniet. Inventore aperiam expedita vero austo eveniet qui. Et libero ipsa ut velit nobis. Est animi earum eveniet atque velit. Est voluptatum rerum maxime odit nesciunt ipsum inventore molestiae inventore. Blanditiis eos ut. eos fuga eveniet. Inventore aperiam expedita vero a usto eveniet qui.',
                  ),
                  const SizedBox(height: 32),
                  // Section 3
                  _buildSectionTitle('Intellectual Property'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'Repellat eos fuga eveniet. Inventore aperiam expedita vero austo eveniet qui. Et libero ipsa ut velit nobis. Est animi earum eveniet atque velit. Est voluptatum rerum maxime odit nesciunt ipsum inventore molestiae inventore. Blanditiis eos ut. eos fuga eveniet. Inventore aperiam expedita vero a usto eveniet qui.',
                  ),
                  const SizedBox(height: 32),
                  // Accept button
                  Container(
                    height: 69,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(34.5),
                    ),
                    child: Center(
                      child: Text(
                        'Accept',
                        style: AppTypography.labelLarge.copyWith(
                          color: AppColors.background,
                          fontWeight: AppTypography.semiBold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Decline button
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Decline',
                        style: AppTypography.labelLarge.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: AppTypography.semiBold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTypography.bodyMedium.copyWith(
        color: AppColors.onSurface,
        fontWeight: AppTypography.regular,
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: AppTypography.bodySmall.copyWith(
        color: AppColors.onSurface,
        fontWeight: AppTypography.thin,
        fontSize: 13,
        height: 1.23,
      ),
    );
  }
}
