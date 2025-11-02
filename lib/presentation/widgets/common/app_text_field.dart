import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Text field variants for different use cases
enum AppTextFieldVariant {
  outlined,
  filled,
}

/// Reusable text field component with validation and theming
class CommonAppTextField extends StatefulWidget {
  const CommonAppTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.variant = AppTextFieldVariant.outlined,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final AppTextFieldVariant variant;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;

  @override
  State<CommonAppTextField> createState() => _CommonAppTextFieldState();
}

class _CommonAppTextFieldState extends State<CommonAppTextField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: _obscureText,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          autofocus: widget.autofocus,
          autocorrect: widget.autocorrect,
          enableSuggestions: widget.enableSuggestions,
          style: theme.textTheme.bodyLarge,
          decoration: _buildInputDecoration(theme),
        ),
        if (widget.helperText != null && widget.errorText == null)
          Padding(
            padding: const EdgeInsets.only(
              top: AppSpacing.xs,
              left: AppSpacing.lg,
            ),
            child: Text(
              widget.helperText!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(ThemeData theme) {
    final ColorScheme colorScheme = theme.colorScheme;
    
    return InputDecoration(
      labelText: widget.labelText,
      hintText: widget.hintText,
      errorText: widget.errorText,
      prefixIcon: widget.prefixIcon,
      suffixIcon: _buildSuffixIcon(theme),
      filled: false, // No fill
      fillColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 24,
      ),
      labelStyle: theme.textTheme.bodyMedium?.copyWith(
        color: _isFocused
            ? colorScheme.primary
            : colorScheme.onSurfaceVariant,
      ),
      hintStyle: theme.textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      errorStyle: theme.textTheme.bodySmall?.copyWith(
        color: colorScheme.error,
      ),
      helperStyle: theme.textTheme.bodySmall?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }

  Widget? _buildSuffixIcon(ThemeData theme) {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        onPressed: _toggleObscureText,
      );
    }
    return widget.suffixIcon;
  }

  InputBorder _buildBorder(
    ThemeData theme, {
    required bool isError,
    required bool isFocused,
  }) {
    final ColorScheme colorScheme = theme.colorScheme;
    
    BorderSide borderSide;

    if (isError) {
      borderSide = BorderSide(
        color: colorScheme.error,
        width: isFocused ? 2 : 1,
      );
    } else if (isFocused) {
      borderSide = BorderSide(
        color: colorScheme.primary,
        width: 2,
      );
    } else {
      // No border when not focused (Figma style)
      borderSide = BorderSide.none;
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(34.5), // From Figma: 34.5px
      borderSide: borderSide,
    );
  }
}