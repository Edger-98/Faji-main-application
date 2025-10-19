import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/presentation/providers/theme_provider.dart';
import 'package:fajimobileapp/presentation/widgets/common/common_widgets.dart';

/// Widget to showcase all component library widgets
class ComponentShowcase extends ConsumerWidget {
  const ComponentShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDark = ref.watch(isDarkThemeProvider);

    return AppScaffold(
      title: 'Component Library',
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
            _buildSection('Buttons', _buildButtonsDemo(context)),
            const SizedBox(height: AppSpacing.sectionSpacing),
            _buildSection('Text Fields', _buildTextFieldsDemo()),
            const SizedBox(height: AppSpacing.sectionSpacing),
            _buildSection('Cards', _buildCardsDemo(context)),
            const SizedBox(height: AppSpacing.sectionSpacing),
            _buildSection('Dialogs & Sheets', _buildDialogsDemo(context)),
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
          style: AppTypography.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.elementSpacing),
        content,
      ],
    );
  }

  Widget _buildButtonsDemo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Primary Buttons
        const Text('Primary Buttons', style: AppTypography.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.buttonSpacing,
          runSpacing: AppSpacing.buttonSpacing,
          children: <Widget>[
            AppButton.primary(
              onPressed: () => _showSnackBar(context, 'Primary button pressed'),
              child: const Text('Primary'),
            ),
            AppButton.primary(
              onPressed: () => _showSnackBar(context, 'Primary with icon pressed'),
              icon: const Icon(Icons.star),
              child: const Text('With Icon'),
            ),
            const AppButton.primary(
              onPressed: null,
              child: Text('Disabled'),
            ),
            const AppButton.primary(
              onPressed: null,
              isLoading: true,
              child: Text('Loading'),
            ),
          ],
        ),
        
        const SizedBox(height: AppSpacing.lg),
        
        // Secondary Buttons
        const Text('Secondary Buttons', style: AppTypography.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.buttonSpacing,
          runSpacing: AppSpacing.buttonSpacing,
          children: <Widget>[
            AppButton.secondary(
              onPressed: () => _showSnackBar(context, 'Secondary button pressed'),
              child: const Text('Secondary'),
            ),
            AppButton.secondary(
              onPressed: () => _showSnackBar(context, 'Secondary with icon pressed'),
              icon: const Icon(Icons.favorite),
              child: const Text('With Icon'),
            ),
          ],
        ),
        
        const SizedBox(height: AppSpacing.lg),
        
        // Text Buttons
        const Text('Text Buttons', style: AppTypography.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.buttonSpacing,
          runSpacing: AppSpacing.buttonSpacing,
          children: <Widget>[
            AppButton.text(
              onPressed: () => _showSnackBar(context, 'Text button pressed'),
              child: const Text('Text'),
            ),
            AppButton.text(
              onPressed: () => _showSnackBar(context, 'Text with icon pressed'),
              icon: const Icon(Icons.info),
              child: const Text('With Icon'),
            ),
          ],
        ),
        
        const SizedBox(height: AppSpacing.lg),
        
        // Icon Buttons
        const Text('Icon Buttons', style: AppTypography.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.buttonSpacing,
          runSpacing: AppSpacing.buttonSpacing,
          children: <Widget>[
            AppButton.icon(
              onPressed: () => _showSnackBar(context, 'Icon button pressed'),
              icon: const Icon(Icons.add),
            ),
            AppButton.icon(
              onPressed: () => _showSnackBar(context, 'Heart icon pressed'),
              icon: const Icon(Icons.favorite),
            ),
            AppButton.icon(
              onPressed: () => _showSnackBar(context, 'Settings icon pressed'),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldsDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const AppTextField(
          labelText: 'Email',
          hintText: 'Enter your email',
          helperText: 'We\'ll never share your email',
          prefixIcon: Icon(Icons.email),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: AppSpacing.lg),
        const AppTextField(
          labelText: 'Password',
          hintText: 'Enter your password',
          obscureText: true,
          prefixIcon: Icon(Icons.lock),
        ),
        const SizedBox(height: AppSpacing.lg),
        const AppTextField(
          labelText: 'Message',
          hintText: 'Enter your message',
          maxLines: 3,
          variant: AppTextFieldVariant.filled,
        ),
        const SizedBox(height: AppSpacing.lg),
        const AppTextField(
          labelText: 'Disabled Field',
          hintText: 'This field is disabled',
          enabled: false,
          prefixIcon: Icon(Icons.block),
        ),
      ],
    );
  }

  Widget _buildCardsDemo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Elevated Card
        AppCard.elevated(
          onTap: () => _showSnackBar(context, 'Elevated card tapped'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Elevated Card', style: AppTypography.titleMedium),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'This is an elevated card with shadow and surface tint.',
                style: AppTypography.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.md),
              AppButton.text(
                onPressed: () => _showSnackBar(context, 'Card action pressed'),
                child: const Text('Action'),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: AppSpacing.lg),
        
        // Filled Card
        AppCard.filled(
          onTap: () => _showSnackBar(context, 'Filled card tapped'),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Filled Card', style: AppTypography.titleMedium),
              SizedBox(height: AppSpacing.sm),
              Text(
                'This is a filled card with background color.',
                style: AppTypography.bodyMedium,
              ),
            ],
          ),
        ),
        
        const SizedBox(height: AppSpacing.lg),
        
        // Outlined Card
        AppCard.outlined(
          onTap: () => _showSnackBar(context, 'Outlined card tapped'),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Outlined Card', style: AppTypography.titleMedium),
              SizedBox(height: AppSpacing.sm),
              Text(
                'This is an outlined card with border.',
                style: AppTypography.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDialogsDemo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          spacing: AppSpacing.buttonSpacing,
          runSpacing: AppSpacing.buttonSpacing,
          children: <Widget>[
            AppButton.secondary(
              onPressed: () => _showAlertDialog(context),
              child: const Text('Show Alert'),
            ),
            AppButton.secondary(
              onPressed: () => _showConfirmationDialog(context),
              child: const Text('Show Confirmation'),
            ),
            AppButton.secondary(
              onPressed: () => _showLoadingDialog(context),
              child: const Text('Show Loading'),
            ),
            AppButton.secondary(
              onPressed: () => _showBottomSheet(context),
              child: const Text('Show Bottom Sheet'),
            ),
            AppButton.secondary(
              onPressed: () => _showDraggableSheet(context),
              child: const Text('Show Draggable Sheet'),
            ),
          ],
        ),
      ],
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

  void _showAlertDialog(BuildContext context) {
    AppDialog.showAlert(
      context,
      title: 'Alert Dialog',
      message: 'This is an alert dialog with important information.',
      icon: const Icon(Icons.info, size: 32),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    AppDialog.showConfirmation(
      context,
      title: 'Confirmation Dialog',
      message: 'Are you sure you want to perform this action?',
      icon: const Icon(Icons.warning, size: 32),
      onConfirm: () => _showSnackBar(context, 'Action confirmed'),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    AppDialog.showLoading(
      context,
      message: 'Loading...',
    );
    
    // Auto-hide after 2 seconds
    Future<void>.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        AppDialog.hideLoading(context);
      }
    });
  }

  void _showBottomSheet(BuildContext context) {
    AppBottomSheet.showModal<void>(
      context,
      title: 'Bottom Sheet',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
          ),
          const ListTile(
            leading: Icon(Icons.copy),
            title: Text('Copy'),
          ),
          const ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton.primary(
            onPressed: () {
              Navigator.of(context).pop();
              _showSnackBar(context, 'Bottom sheet action performed');
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  void _showDraggableSheet(BuildContext context) {
    AppBottomSheet.showDraggable<void>(
      context,
      title: 'Draggable Sheet',
      initialChildSize: 0.4,
      maxChildSize: 0.8,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('Item ${index + 1}'),
            subtitle: Text('This is item number ${index + 1}'),
            onTap: () => _showSnackBar(context, 'Item ${index + 1} tapped'),
          );
        },
      ),
    );
  }
}