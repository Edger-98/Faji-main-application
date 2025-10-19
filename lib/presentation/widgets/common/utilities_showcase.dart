import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/presentation/providers/theme_provider.dart';
import 'package:fajimobileapp/presentation/widgets/common/common_widgets.dart';

/// Widget to showcase all utility functions
class UtilitiesShowcase extends ConsumerStatefulWidget {
  const UtilitiesShowcase({super.key});

  @override
  ConsumerState<UtilitiesShowcase> createState() => _UtilitiesShowcaseState();
}

class _UtilitiesShowcaseState extends ConsumerState<UtilitiesShowcase> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  
  String _validationResult = '';
  String _formattingResult = '';
  String _helperResult = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = ref.watch(isDarkThemeProvider);

    return AppScaffold(
      title: 'Utilities Showcase',
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
            _buildSection('Validation & Sanitization', _buildValidationDemo()),
            const SizedBox(height: AppSpacing.sectionSpacing),
            _buildSection('Formatting', _buildFormattingDemo()),
            const SizedBox(height: AppSpacing.sectionSpacing),
            _buildSection('Helpers & Utilities', _buildHelpersDemo()),
            const SizedBox(height: AppSpacing.sectionSpacing),
            _buildSection('Error Handling', _buildErrorHandlingDemo()),
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

  Widget _buildValidationDemo() {
    return AppCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Test Validation & Sanitization', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.lg),
          
          AppTextField(
            controller: _emailController,
            labelText: 'Email',
            hintText: 'Enter email to validate',
            keyboardType: TextInputType.emailAddress,
            validator: Validators.email,
          ),
          const SizedBox(height: AppSpacing.md),
          
          AppTextField(
            controller: _passwordController,
            labelText: 'Password',
            hintText: 'Enter password to validate',
            obscureText: true,
            validator: Validators.password,
          ),
          const SizedBox(height: AppSpacing.md),
          
          AppTextField(
            controller: _phoneController,
            labelText: 'Phone Number',
            hintText: 'Enter phone number',
            keyboardType: TextInputType.phone,
            validator: Validators.phoneNumber,
          ),
          const SizedBox(height: AppSpacing.md),
          
          AppTextField(
            controller: _nameController,
            labelText: 'Full Name',
            hintText: 'Enter your name',
            validator: (String? value) => Validators.name(value, fieldName: 'Full Name'),
          ),
          const SizedBox(height: AppSpacing.lg),
          
          AppButton.primary(
            onPressed: _validateAndSanitize,
            child: const Text('Validate & Sanitize'),
          ),
          
          if (_validationResult.isNotEmpty) ...<Widget>[
            const SizedBox(height: AppSpacing.lg),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _validationResult,
                style: AppTypography.bodySmall,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFormattingDemo() {
    return AppCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Formatting Examples', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.lg),
          
          _buildFormatExample('Currency', Formatters.currency(1234.56)),
          _buildFormatExample('Percentage', Formatters.percentage(0.1234)),
          _buildFormatExample('Compact Number', Formatters.compactNumber(1234567)),
          _buildFormatExample('Phone Number', Formatters.phoneNumber('1234567890')),
          _buildFormatExample('Credit Card', Formatters.creditCard('1234567890123456')),
          _buildFormatExample('Date', Formatters.date(DateTime.now())),
          _buildFormatExample('Relative Time', Formatters.relativeTime(DateTime.now().subtract(const Duration(hours: 2)))),
          _buildFormatExample('File Size', Formatters.fileSize(1234567)),
          _buildFormatExample('Duration', Formatters.duration(const Duration(hours: 2, minutes: 30))),
          
          const SizedBox(height: AppSpacing.lg),
          AppButton.secondary(
            onPressed: _demonstrateFormatting,
            child: const Text('Refresh Examples'),
          ),
          
          if (_formattingResult.isNotEmpty) ...<Widget>[
            const SizedBox(height: AppSpacing.lg),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _formattingResult,
                style: AppTypography.bodySmall,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFormatExample(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: AppTypography.labelMedium,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTypography.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpersDemo() {
    return AppCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Helper Functions', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.lg),
          
          Wrap(
            spacing: AppSpacing.buttonSpacing,
            runSpacing: AppSpacing.buttonSpacing,
            children: <Widget>[
              AppButton.secondary(
                onPressed: _generateRandomString,
                child: const Text('Random String'),
              ),
              AppButton.secondary(
                onPressed: _generateUuid,
                child: const Text('Generate UUID'),
              ),
              AppButton.secondary(
                onPressed: _copyToClipboard,
                child: const Text('Copy to Clipboard'),
              ),
              AppButton.secondary(
                onPressed: _triggerHaptic,
                child: const Text('Haptic Feedback'),
              ),
              AppButton.secondary(
                onPressed: _demonstrateRetry,
                child: const Text('Retry Function'),
              ),
            ],
          ),
          
          if (_helperResult.isNotEmpty) ...<Widget>[
            const SizedBox(height: AppSpacing.lg),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _helperResult,
                style: AppTypography.bodySmall,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildErrorHandlingDemo() {
    return AppCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Error Handling', style: AppTypography.titleMedium),
          const SizedBox(height: AppSpacing.lg),
          
          Wrap(
            spacing: AppSpacing.buttonSpacing,
            runSpacing: AppSpacing.buttonSpacing,
            children: <Widget>[
              AppButton.secondary(
                onPressed: () => _demonstrateError(const NetworkFailure.noConnection()),
                child: const Text('Network Error'),
              ),
              AppButton.secondary(
                onPressed: () => _demonstrateError(ServerFailure.fromStatusCode(404)),
                child: const Text('Server Error'),
              ),
              AppButton.secondary(
                onPressed: () => _demonstrateError(AuthFailure.invalidCredentials()),
                child: const Text('Auth Error'),
              ),
              AppButton.secondary(
                onPressed: () => _demonstrateError(ValidationFailure.requiredField('Email')),
                child: const Text('Validation Error'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _validateAndSanitize() {
    final StringBuffer result = StringBuffer();
    
    // Validate inputs
    final String? emailError = Validators.email(_emailController.text);
    final String? passwordError = Validators.password(_passwordController.text);
    final String? phoneError = Validators.phoneNumber(_phoneController.text);
    final String? nameError = Validators.name(_nameController.text, fieldName: 'Full Name');
    
    result.writeln('VALIDATION RESULTS:');
    result.writeln('Email: ${emailError ?? 'Valid ✓'}');
    result.writeln('Password: ${passwordError ?? 'Valid ✓'}');
    result.writeln('Phone: ${phoneError ?? 'Valid ✓'}');
    result.writeln('Name: ${nameError ?? 'Valid ✓'}');
    
    result.writeln('\nSANITIZED VALUES:');
    result.writeln('Email: ${Sanitizers.email(_emailController.text)}');
    result.writeln('Phone: ${Sanitizers.phoneNumber(_phoneController.text)}');
    result.writeln('Name: ${Sanitizers.name(_nameController.text)}');
    
    setState(() {
      _validationResult = result.toString();
    });
  }

  void _demonstrateFormatting() {
    final StringBuffer result = StringBuffer();
    final DateTime now = DateTime.now();
    
    result.writeln('DYNAMIC FORMATTING:');
    result.writeln('Current Time: ${Formatters.time(now)}');
    result.writeln('Random Currency: ${Formatters.currency(DateTime.now().millisecond * 12.34)}');
    result.writeln('Random Percentage: ${Formatters.percentage(DateTime.now().millisecond / 1000)}');
    result.writeln('Address Format:');
    result.writeln(Formatters.address(
      street: '123 Main St',
      city: 'Anytown',
      state: 'CA',
      postalCode: '12345',
      country: 'USA',
    ));
    
    setState(() {
      _formattingResult = result.toString();
    });
  }

  void _generateRandomString() {
    final String randomString = Helpers.generateRandomString(16);
    setState(() {
      _helperResult = 'Random String: $randomString';
    });
  }

  void _generateUuid() {
    final String uuid = Helpers.generateUuid();
    setState(() {
      _helperResult = 'UUID: $uuid';
    });
  }

  Future<void> _copyToClipboard() async {
    const String text = 'This text was copied using Helpers.copyToClipboard()';
    await Helpers.copyToClipboard(text);
    setState(() {
      _helperResult = 'Copied to clipboard: $text';
    });
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Text copied to clipboard!')),
      );
    }
  }

  Future<void> _triggerHaptic() async {
    await Helpers.mediumHaptic();
    setState(() {
      _helperResult = 'Medium haptic feedback triggered';
    });
  }

  Future<void> _demonstrateRetry() async {
    int attempts = 0;
    
    try {
      await Helpers.retry(() async {
        attempts++;
        if (attempts < 3) {
          throw Exception('Simulated failure (attempt $attempts)');
        }
        return 'Success!';
      });
      
      setState(() {
        _helperResult = 'Retry succeeded after $attempts attempts';
      });
    } catch (e) {
      setState(() {
        _helperResult = 'Retry failed after $attempts attempts: $e';
      });
    }
  }

  void _demonstrateError(Failure failure) {
    final String userMessage = ErrorHandler.getErrorMessage(failure);
    final bool isRecoverable = ErrorHandler.isRecoverable(failure);
    
    ErrorHandler.logError(failure);
    
    AppDialog.showAlert(
      context,
      title: 'Error Demonstration',
      message: '$userMessage\n\nRecoverable: ${isRecoverable ? 'Yes' : 'No'}',
      icon: Icon(
        isRecoverable ? Icons.warning : Icons.error,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}