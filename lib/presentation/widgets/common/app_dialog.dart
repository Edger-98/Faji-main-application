import 'package:flutter/material.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/presentation/widgets/common/app_button.dart';

/// Dialog variants for different use cases
enum AppDialogVariant {
  alert,
  confirmation,
  custom,
}

/// Reusable dialog component with consistent styling
class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.variant = AppDialogVariant.custom,
    this.icon,
    this.onConfirm,
    this.onCancel,
    this.confirmText,
    this.cancelText,
    this.barrierDismissible = true,
  });

  /// Factory constructor for alert dialog
  const AppDialog.alert({
    required this.title,
    required this.content,
    super.key,
    this.icon,
    this.onConfirm,
    this.confirmText,
    this.barrierDismissible = true,
  }) : variant = AppDialogVariant.alert,
       actions = null,
       onCancel = null,
       cancelText = null;

  /// Factory constructor for confirmation dialog
  const AppDialog.confirmation({
    required this.title,
    required this.content,
    required this.onConfirm,
    super.key,
    this.icon,
    this.onCancel,
    this.confirmText,
    this.cancelText,
    this.barrierDismissible = true,
  }) : variant = AppDialogVariant.confirmation,
       actions = null;

  final String? title;
  final Widget? content;
  final List<Widget>? actions;
  final AppDialogVariant variant;
  final Widget? icon;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String? confirmText;
  final String? cancelText;
  final bool barrierDismissible;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return AlertDialog(
      icon: icon,
      title: title != null ? Text(title!) : null,
      content: content,
      actions: _buildActions(context, theme),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      actionsPadding: const EdgeInsets.all(AppSpacing.lg),
      titlePadding: const EdgeInsets.fromLTRB(
        AppSpacing.xxl,
        AppSpacing.xxl,
        AppSpacing.xxl,
        AppSpacing.md,
      ),
      contentPadding: const EdgeInsets.fromLTRB(
        AppSpacing.xxl,
        0,
        AppSpacing.xxl,
        AppSpacing.lg,
      ),
    );
  }

  List<Widget>? _buildActions(BuildContext context, ThemeData theme) {
    switch (variant) {
      case AppDialogVariant.alert:
        return <Widget>[
          AppButton.text(
            onPressed: onConfirm ?? () => Navigator.of(context).pop(),
            child: Text(confirmText ?? 'OK'),
          ),
        ];
      
      case AppDialogVariant.confirmation:
        return <Widget>[
          AppButton.text(
            onPressed: onCancel ?? () => Navigator.of(context).pop(false),
            child: Text(cancelText ?? 'Cancel'),
          ),
          const SizedBox(width: AppSpacing.sm),
          AppButton.primary(
            onPressed: () {
              Navigator.of(context).pop(true);
              onConfirm?.call();
            },
            child: Text(confirmText ?? 'Confirm'),
          ),
        ];
      
      case AppDialogVariant.custom:
        return actions;
    }
  }

  /// Show alert dialog
  static Future<void> showAlert(
    BuildContext context, {
    required String title,
    required String message,
    Widget? icon,
    String? confirmText,
    VoidCallback? onConfirm,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AppDialog.alert(
        title: title,
        content: Text(message),
        icon: icon,
        confirmText: confirmText,
        onConfirm: onConfirm,
      ),
    );
  }

  /// Show confirmation dialog
  static Future<bool?> showConfirmation(
    BuildContext context, {
    required String title,
    required String message,
    Widget? icon,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AppDialog.confirmation(
        title: title,
        content: Text(message),
        icon: icon,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }

  /// Show loading dialog
  static void showLoading(
    BuildContext context, {
    String? message,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AppDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CircularProgressIndicator(),
            if (message != null) ...<Widget>[
              const SizedBox(height: AppSpacing.lg),
              Text(message),
            ],
          ],
        ),
      ),
    );
  }

  /// Hide loading dialog
  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}