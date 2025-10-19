import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/presentation/providers/theme_provider.dart';
import 'package:fajimobileapp/presentation/widgets/common/common_widgets.dart';

/// Widget to showcase the Faji App design system based on Figma specifications
class FajiDesignShowcase extends ConsumerWidget {
  const FajiDesignShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDark = ref.watch(isDarkThemeProvider);
    final ThemeData theme = Theme.of(context);

    return AppScaffold(
      title: 'Faji Design System',
      actions: <Widget>[
        IconButton(
          icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
        ),
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSection('Faji Brand Colors', _buildColorsDemo(theme)),
            const SizedBox(height: AppSpacing.sectionSpacing),
            _buildSection('Typography (Figma Fonts)', _buildTypographyDemo(theme)),
            const SizedBox(height: AppSpacing.sectionSpacing),
            _buildSection('Buttons (Figma Style)', _buildButtonsDemo(context)),
            const SizedBox(height: AppSpacing.sectionSpacing),
            _buildSection('Input Fields (Figma Style)', _buildInputFieldsDemo()),
            const SizedBox(height: AppSpacing.sectionSpacing),
            _buildSection('Onboarding Flow Preview', _buildOnboardingPreview(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: AppTypography.headlineMedium,
        ),
        const SizedBox(height: AppSpacing.elementSpacing),
        content,
      ],
    );
  }

  Widget _buildColorsDemo(ThemeData theme) {
    return AppCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Brand Colors from Figma', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: <Widget>[
              _buildColorSwatch('Primary Pink', const Color(0xFFFD99C9), '#FD99C9'),
              _buildColorSwatch('Background Dark', const Color(0xFF1F1F1F), '#1F1F1F'),
              _buildColorSwatch('Text Light', const Color(0xFFF8F8F8), '#F8F8F8'),
              _buildColorSwatch('Text Gray', const Color(0xFFA1A1A1), '#A1A1A1'),
              _buildColorSwatch('Input Background', const Color(0x52282828), 'rgba(40,40,40,0.81)'),
              _buildColorSwatch('White', const Color(0xFFFFFFFF), '#FFFFFF'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorSwatch(String name, Color color, String hex) {
    return Column(
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          name,
          style: AppTypography.labelSmall,
          textAlign: TextAlign.center,
        ),
        Text(
          hex,
          style: AppTypography.bodySmall.copyWith(
            fontFamily: 'monospace',
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTypographyDemo(ThemeData theme) {
    return AppCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Figma Typography Specs', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.lg),
          
          _buildTypographyExample(
            'Display Large (37px)',
            'Voyage through',
            AppTypography.displayLarge,
            'Neue Haas Grotesk Display Pro, 600 weight',
          ),
          
          _buildTypographyExample(
            'Headline Medium (28px)',
            'What is your email?',
            AppTypography.headlineMedium,
            'Neue Haas Grotesk Display Pro, 600 weight',
          ),
          
          _buildTypographyExample(
            'Body Large (17px)',
            'Enter your email address. We will send you a confirmation code there.',
            AppTypography.bodyLarge,
            'PP Neue Montreal, 100 weight',
          ),
          
          _buildTypographyExample(
            'Label Large (18px)',
            'Continue',
            AppTypography.labelLarge,
            'Neue Haas Grotesk Display Pro, 600 weight',
          ),
        ],
      ),
    );
  }

  Widget _buildTypographyExample(String label, String text, TextStyle style, String specs) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: AppTypography.labelSmall),
          const SizedBox(height: AppSpacing.xs),
          Text(text, style: style),
          const SizedBox(height: AppSpacing.xs),
          Text(
            specs,
            style: AppTypography.bodySmall.copyWith(
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildButtonsDemo(BuildContext context) {
    return AppCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Figma Button Specs', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const Text('29.5px border radius, 59px height, 190px width', style: AppTypography.bodySmall),
          const SizedBox(height: AppSpacing.lg),
          
          Column(
            children: <Widget>[
              SizedBox(
                width: 190,
                child: ElevatedButton(
                  onPressed: () => _showSnackBar(context, 'Get Started pressed'),
                  child: const Text('Get Started'),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                width: 190,
                child: ElevatedButton(
                  onPressed: () => _showSnackBar(context, 'Continue pressed'),
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                width: 190,
                child: OutlinedButton(
                  onPressed: () => _showSnackBar(context, 'Secondary action pressed'),
                  child: const Text('Secondary'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputFieldsDemo() {
    return AppCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Figma Input Field Specs', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          const Text('34.5px border radius, 69px height, dark background', style: AppTypography.bodySmall),
          const SizedBox(height: AppSpacing.lg),
          
          const AppTextField(
            labelText: 'Email address',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppSpacing.md),
          
          const AppTextField(
            labelText: 'Phone Number',
            hintText: 'Enter your phone number',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: AppSpacing.md),
          
          const AppTextField(
            labelText: 'First name',
            hintText: 'Enter your first name',
          ),
          const SizedBox(height: AppSpacing.md),
          
          const AppTextField(
            labelText: 'Password',
            hintText: 'Create a password',
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPreview(BuildContext context) {
    return AppCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Onboarding Flow Preview', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.lg),
          
          // Simulate onboarding screen layout
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F1F),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Back button
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0x52282828),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                
                const SizedBox(height: AppSpacing.xl),
                
                // Title
                Text(
                  'What is your email?',
                  style: AppTypography.headlineMedium.copyWith(
                    color: const Color(0xFFF8F8F8),
                  ),
                ),
                
                const SizedBox(height: AppSpacing.sm),
                
                // Subtitle
                Text(
                  'Enter your email address. We will send you a confirmation code there.',
                  style: AppTypography.bodyLarge.copyWith(
                    color: const Color(0xFFA1A1A1),
                  ),
                ),
                
                const SizedBox(height: AppSpacing.xl),
                
                // Input field
                Container(
                  width: double.infinity,
                  height: 69,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                  decoration: BoxDecoration(
                    color: const Color(0x52282828),
                    borderRadius: BorderRadius.circular(34.5),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email address',
                      style: AppTypography.bodyLarge.copyWith(
                        color: const Color(0xFFA1A1A1),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: AppSpacing.massive),
                
                // Continue button
                Center(
                  child: Container(
                    width: 190,
                    height: 59,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFD99C9),
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: AppTypography.labelLarge.copyWith(
                          color: const Color(0xFF1F1F1F),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: AppSpacing.lg),
          
          ElevatedButton(
            onPressed: () => _showOnboardingDialog(context),
            child: const Text('View Full Onboarding Flow'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showOnboardingDialog(BuildContext context) {
    AppDialog.showAlert(
      context,
      title: 'Onboarding Flow',
      message: 'This preview shows the Faji App design system applied to match the Figma specifications:\n\n• Pink brand color (#FD99C9)\n• Dark background (#1F1F1F)\n• Rounded inputs (34.5px radius)\n• Rounded buttons (29.5px radius)\n• Neue Haas Grotesk for headings\n• PP Neue Montreal for body text',
      icon: const Icon(Icons.design_services, size: 32),
    );
  }
}