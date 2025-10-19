import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/presentation/providers/theme_provider.dart';

/// Widget to showcase the design system components
class DesignSystemShowcase extends ConsumerWidget {
  const DesignSystemShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = ref.watch(isDarkThemeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Design System Showcase'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Colors Section
            _buildSection(
              'Colors',
              _buildColorsDemo(theme),
            ),
            
            SizedBox(height: AppSpacing.sectionSpacing),
            
            // Typography Section
            _buildSection(
              'Typography',
              _buildTypographyDemo(theme),
            ),
            
            SizedBox(height: AppSpacing.sectionSpacing),
            
            // Buttons Section
            _buildSection(
              'Buttons',
              _buildButtonsDemo(),
            ),
            
            SizedBox(height: AppSpacing.sectionSpacing),
            
            // Cards Section
            _buildSection(
              'Cards',
              _buildCardsDemo(theme),
            ),
            
            SizedBox(height: AppSpacing.sectionSpacing),
            
            // Spacing Section
            _buildSection(
              'Spacing',
              _buildSpacingDemo(theme),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.headlineSmall,
        ),
        SizedBox(height: AppSpacing.elementSpacing),
        content,
      ],
    );
  }

  Widget _buildColorsDemo(ThemeData theme) {
    return Wrap(
      spacing: AppSpacing.elementSpacing,
      runSpacing: AppSpacing.elementSpacing,
      children: [
        _buildColorSwatch('Primary', theme.colorScheme.primary),
        _buildColorSwatch('Secondary', theme.colorScheme.secondary),
        _buildColorSwatch('Tertiary', theme.colorScheme.tertiary),
        _buildColorSwatch('Error', theme.colorScheme.error),
        _buildColorSwatch('Surface', theme.colorScheme.surface),
        _buildColorSwatch('Success', AppColors.success),
        _buildColorSwatch('Warning', AppColors.warning),
        _buildColorSwatch('Info', AppColors.info),
      ],
    );
  }

  Widget _buildColorSwatch(String name, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
          ),
        ),
        SizedBox(height: AppSpacing.xs),
        Text(
          name,
          style: AppTypography.labelSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTypographyDemo(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display Large', style: theme.textTheme.displayLarge),
        SizedBox(height: AppSpacing.sm),
        Text('Headline Large', style: theme.textTheme.headlineLarge),
        SizedBox(height: AppSpacing.sm),
        Text('Title Large', style: theme.textTheme.titleLarge),
        SizedBox(height: AppSpacing.sm),
        Text('Body Large', style: theme.textTheme.bodyLarge),
        SizedBox(height: AppSpacing.sm),
        Text('Label Large', style: theme.textTheme.labelLarge),
      ],
    );
  }

  Widget _buildButtonsDemo() {
    return Wrap(
      spacing: AppSpacing.buttonSpacing,
      runSpacing: AppSpacing.buttonSpacing,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Elevated'),
        ),
        FilledButton(
          onPressed: () {},
          child: Text('Filled'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text('Outlined'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Text'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.star),
          label: Text('Icon'),
        ),
      ],
    );
  }

  Widget _buildCardsDemo(ThemeData theme) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card Title',
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: AppSpacing.elementSpacing),
                Text(
                  'This is a sample card with some content to demonstrate the card styling and spacing.',
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(height: AppSpacing.elementSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Action'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpacingDemo(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSpacingItem('XS (4px)', AppSpacing.xs, theme),
        _buildSpacingItem('SM (8px)', AppSpacing.sm, theme),
        _buildSpacingItem('MD (12px)', AppSpacing.md, theme),
        _buildSpacingItem('LG (16px)', AppSpacing.lg, theme),
        _buildSpacingItem('XL (20px)', AppSpacing.xl, theme),
        _buildSpacingItem('XXL (24px)', AppSpacing.xxl, theme),
      ],
    );
  }

  Widget _buildSpacingItem(String label, double spacing, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: theme.textTheme.labelMedium,
            ),
          ),
          Container(
            width: spacing,
            height: 20,
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}