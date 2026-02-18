import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/support/presentation/screens/faqs_screen.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

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
                  // Send us an email
                  _buildSupportOption(
                    context,
                    'Send us an email',
                    'support@faji.app',
                    Icons.email_outlined,
                    onTap: () => _sendEmail(context),
                  ),
                  SizedBox(height: 17.h),
                  // FAQs
                  _buildSupportOption(
                    context,
                    'FAQs',
                    'Frequently Asked Questions',
                    Icons.help_outline,
                    onTap: () => Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const FaqsScreen(),
                      ),
                    ),
                  ),
                  // Debug option (only in debug mode)
            
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  static Future<void> _sendEmail(BuildContext context) async {
    // Try multiple approaches to open email
    final approaches = [
      () => _tryMailtoUri(context),
      () => _tryEmailIntent(context),
      () => _tryWebEmail(context),
    ];

    bool success = false;
    for (final approach in approaches) {
      try {
        success = await approach();
        if (success) break;
      } catch (e) {
        // Continue to next approach
        continue;
      }
    }

    if (!success && context.mounted) {
      _showEmailOptionsDialog(context);
    }
  }

  static Future<bool> _tryMailtoUri(BuildContext context) async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: 'support@faji.app',
      queryParameters: {
        'subject': 'Faji Support Request',
        'body': 'Hello Faji Support Team,\n\nI need help with:\n\n',
      },
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        return await launchUrl(
          emailUri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      // Ignore and try next approach
    }
    return false;
  }

  static Future<bool> _tryEmailIntent(BuildContext context) async {
    // Try with SENDTO action (Android specific)
    final sendtoUri = Uri(
      scheme: 'mailto',
      path: 'support@faji.app',
      query: 'subject=Faji Support Request&body=Hello Faji Support Team,%0A%0AI need help with:%0A%0A',
    );

    try {
      if (await canLaunchUrl(sendtoUri)) {
        return await launchUrl(
          sendtoUri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      // Ignore and try next approach
    }
    return false;
  }

  static Future<bool> _tryWebEmail(BuildContext context) async {
    // Try Gmail web interface as fallback
    final gmailUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm&to=support@faji.app&su=Faji Support Request&body=Hello Faji Support Team,%0A%0AI need help with:%0A%0A'
    );

    try {
      if (await canLaunchUrl(gmailUri)) {
        return await launchUrl(
          gmailUri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      // Ignore
    }
    return false;
  }

  static void _showEmailOptionsDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Contact Support',
            style: AppTypography.headlineSmall.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We\'d love to help! Here are ways to reach us:',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              // Email option
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.searchBarBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Email Us',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'support@faji.app',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => _copyEmailToClipboard(context),
                          icon: Icon(
                            Icons.copy,
                            color: AppColors.primary,
                            size: 18,
                          ),
                          tooltip: 'Copy email',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Copy the email address and paste it in your preferred email app, or try the options below.',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Close',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _openGmailWeb(context);
              },
              child: Text(
                'Open Gmail',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _tryOpenEmailAgain(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Try Again',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> _copyEmailToClipboard(BuildContext context) async {
    try {
      await Clipboard.setData(const ClipboardData(text: 'support@faji.app'));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Email copied to clipboard'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Failed to copy email'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  static Future<void> _openGmailWeb(BuildContext context) async {
    final gmailUri = Uri.parse(
      'https://mail.google.com/mail/?view=cm&to=support@faji.app&su=Faji Support Request&body=Hello Faji Support Team,%0A%0AI need help with:%0A%0A'
    );

    try {
      if (await canLaunchUrl(gmailUri)) {
        await launchUrl(
          gmailUri,
          mode: LaunchMode.externalApplication,
        );
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to open Gmail. Please use your preferred email app.'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to open Gmail. Please use your preferred email app.'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  static Future<void> _tryOpenEmailAgain(BuildContext context) async {
    // Try a simple mailto without query parameters
    final basicMailto = Uri.parse('mailto:support@faji.app');
    
    try {
      if (await canLaunchUrl(basicMailto)) {
        await launchUrl(
          basicMailto,
          mode: LaunchMode.externalApplication,
        );
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No email app found. Please install an email app or contact us at support@faji.app'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to open email app. Please contact support@faji.app manually'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  static Future<void> _debugEmailFunctionality(BuildContext context) async {
    final results = <String>[];
    
    // Test different email approaches
    final testCases = [
      ('Basic mailto', Uri.parse('mailto:support@faji.app')),
      ('Mailto with subject', Uri.parse('mailto:support@faji.app?subject=Test')),
      ('Mailto with params', Uri(
        scheme: 'mailto',
        path: 'support@faji.app',
        queryParameters: {'subject': 'Test', 'body': 'Hello'},
      )),
      ('Gmail web', Uri.parse(
        'https://mail.google.com/mail/?view=cm&to=support@faji.app&su=Test'
      )),
    ];

    for (final (name, uri) in testCases) {
      try {
        final canLaunch = await canLaunchUrl(uri);
        results.add('$name: ${canLaunch ? "✅ CAN" : "❌ CANNOT"} launch');
      } catch (e) {
        results.add('$name: 💥 ERROR - $e');
      }
    }

    if (context.mounted) {
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Email Debug Results'),
          content: SingleChildScrollView(
            child: Text(results.join('\n\n')),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildSupportOption(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
  }) => InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(34.5),
      child: Container(
        height: 69,
        padding: const EdgeInsets.symmetric(horizontal: 27),
        decoration: BoxDecoration(
          color: AppColors.searchBarBackground,
          borderRadius: BorderRadius.circular(34.5),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primary,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.onSurface,
              size: 10,
            ),
          ],
        ),
      ),
    );
}
