import 'package:flutter/material.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
                    'Last updated January 6, 2026',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: AppTypography.thin,
                    ),
                  ),
                  const SizedBox(height: 37),
                  // Introduction
                  _buildParagraph(
                    'Welcome to Faji! These Terms and Conditions govern your use of the Faji mobile application and services. By accessing or using Faji, you agree to be bound by these terms. Please read them carefully before using our platform.',
                  ),
                  const SizedBox(height: 32),
                  // Section 1
                  _buildSectionTitle('1 - Acceptance of Terms'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'By creating an account and using Faji, you confirm that you are at least 18 years old and have the legal capacity to enter into these Terms. You agree to provide accurate, current, and complete information during registration and to update such information to keep it accurate, current, and complete. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.',
                  ),
                  const SizedBox(height: 32),
                  // Section 2
                  _buildSectionTitle('2 - Event Hosting and Ticketing'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'Faji provides a platform for users to create, manage, and sell tickets for events. As an event host, you are solely responsible for the accuracy of event information, ticket pricing, event execution, and compliance with all applicable laws and regulations. Faji acts as a facilitator and is not responsible for the quality, safety, or legality of events hosted on the platform. All ticket sales are subject to our payment processing terms and applicable fees.',
                  ),
                  const SizedBox(height: 32),
                  // Section 3
                  _buildSectionTitle('3 - Vendor Marketplace'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'The Faji marketplace connects event hosts with verified vendors and service providers. Vendors must complete our verification process to offer services. All agreements, payments, and service delivery between hosts and vendors are subject to the terms agreed upon through the platform. Faji facilitates these connections but is not a party to the agreements between hosts and vendors. Disputes should be resolved directly between the parties involved.',
                  ),
                  const SizedBox(height: 32),
                  // Section 4
                  _buildSectionTitle('4 - Payment and Fees'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'Faji charges service fees for ticket sales and vendor bookings as displayed in the app. All payments are processed securely through our payment partners. Event hosts receive payouts according to our payout schedule, minus applicable fees. Refunds are subject to the event host\'s refund policy. Faji reserves the right to hold funds in escrow for verification purposes or in case of disputes.',
                  ),
                  const SizedBox(height: 32),
                  // Section 5
                  _buildSectionTitle('5 - User Conduct'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'You agree not to use Faji for any unlawful purpose or in any way that could damage, disable, or impair the platform. Prohibited activities include: posting false or misleading information, engaging in fraudulent activities, harassing other users, violating intellectual property rights, or attempting to gain unauthorized access to the platform. Faji reserves the right to suspend or terminate accounts that violate these terms.',
                  ),
                  const SizedBox(height: 32),
                  // Section 6
                  _buildSectionTitle('6 - Privacy and Data Protection'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'Your privacy is important to us. We collect, use, and protect your personal information in accordance with our Privacy Policy. By using Faji, you consent to our collection and use of your data as described in our Privacy Policy. We implement industry-standard security measures to protect your information, but cannot guarantee absolute security. You are responsible for maintaining the security of your account credentials.',
                  ),
                  const SizedBox(height: 32),
                  // Section 7
                  _buildSectionTitle('7 - Intellectual Property'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'All content, features, and functionality of Faji, including but not limited to text, graphics, logos, icons, images, and software, are the exclusive property of Faji and are protected by copyright, trademark, and other intellectual property laws. You may not reproduce, distribute, modify, or create derivative works from any content on Faji without our express written permission. User-generated content remains the property of the user, but you grant Faji a license to use, display, and distribute such content on the platform.',
                  ),
                  const SizedBox(height: 32),
                  // Section 8
                  _buildSectionTitle('8 - Limitation of Liability'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'Faji is provided "as is" without warranties of any kind. We do not guarantee that the platform will be error-free, secure, or uninterrupted. To the fullest extent permitted by law, Faji shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of the platform. Our total liability shall not exceed the amount of fees paid by you to Faji in the twelve months preceding the claim.',
                  ),
                  const SizedBox(height: 32),
                  // Section 9
                  _buildSectionTitle('9 - Modifications to Terms'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'Faji reserves the right to modify these Terms and Conditions at any time. We will notify users of significant changes through the app or via email. Your continued use of Faji after such modifications constitutes your acceptance of the updated terms. We encourage you to review these terms periodically to stay informed of any changes.',
                  ),
                  const SizedBox(height: 32),
                  // Section 10
                  _buildSectionTitle('10 - Contact Information'),
                  const SizedBox(height: 0),
                  _buildParagraph(
                    'If you have any questions about these Terms and Conditions, please contact us at support@faji.app. For urgent matters or disputes, you can reach our support team through the app\'s Contact Support feature. We aim to respond to all inquiries within 48 hours.',
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

  Widget _buildSectionTitle(String title) => Text(
      title,
      style: AppTypography.bodyMedium.copyWith(
        color: AppColors.onSurface,
        fontWeight: AppTypography.regular,
      ),
    );

  Widget _buildParagraph(String text) => Text(
      text,
      style: AppTypography.bodySmall.copyWith(
        color: AppColors.onSurface,
        fontWeight: AppTypography.thin,
        fontSize: 13,
        height: 1.23,
      ),
    );
}
