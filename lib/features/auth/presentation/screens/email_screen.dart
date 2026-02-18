import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/registration_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_button.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/back_button_widget.dart';

/// Email input screen matching Figma design (node-id=2-393)
class EmailScreen extends ConsumerStatefulWidget {
  const EmailScreen({super.key});

  @override
  ConsumerState<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends ConsumerState<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateEmail);
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final String email = _emailController.text;
    final bool isValid = email.isNotEmpty && email.contains('@') && email.contains('.');
    if (isValid != _isEmailValid) {
      setState(() {
        _isEmailValid = isValid;
      });
    }
  }

  Future<void> _handleContinue() async {
    if (!_isEmailValid) return;

    FocusScope.of(context).unfocus();
    
    // Call the registration viewmodel
    await ref.read(registrationViewModelProvider.notifier).registerEmail(_emailController.text);
    
    // Check the result
    final RegistrationState state = ref.read(registrationViewModelProvider);
    state.stepState.when(
      initial: () {},
      loading: () {},
      success: (_) {
        // Navigate to OTP screen
        context.goNamed(RouteManager.authPinName);
      },
      error: (Failure failure) {
        // Show error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final RegistrationState registrationState = ref.watch(registrationViewModelProvider);
    final bool isLoading = registrationState.stepState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 
                         MediaQuery.of(context).padding.top - 
                         MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              SizedBox(height: 40.h), // Responsive from Figma
              
              // Back button - positioned at x: 24, y: 64
              const BackButtonWidget(),
              
              SizedBox(height: 32.h), // Responsive spacing
              
              // Title
              AppText.headlineLarge(
                'What is your email?',
                color: context.colors.onSurface,
              ),
              
              SizedBox(height: 16.h), // Responsive spacing
              
              // Subtitle
              AppText.bodyLarge(
                'Enter your email address. We will send you a\nconfirmation code there.',
                color: context.colors.onSurfaceVariant,
              ),
              
              SizedBox(height: 32.h), // Responsive spacing
              
              // Email input field - positioned at x: 24, y: 227, width: 337, height: 69
              AppTextField(
                hintText: 'Email address',
                controller: _emailController,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
              ),
              
              const Spacer(),
              
              // Terms and conditions with TextSpan and animation
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w), // Responsive padding
                child: AnimatedOpacity(
                  opacity: _isEmailValid ? 1.0 : 0.7,
                  duration: const Duration(milliseconds: 300),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 15.sp, // Responsive font size
                        fontWeight: FontWeight.w100,
                        height: 1.3,
                        letterSpacing: 0,
                        color: context.colors.onSurfaceVariant,
                      ),
                      children: <InlineSpan>[
                        const TextSpan(text: "By tapping continue, you're agreeing to our "),
                        TextSpan(
                          text: 'Terms & Condition',
                          style: TextStyle(
                            color: context.colors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: context.colors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 24.h), // Responsive spacing
              
              // Continue button
              AuthButton(
                text: isLoading ? 'Sending...' : 'Continue',
                height: 59.h, // Responsive height
                onPressed: isLoading ? null : _handleContinue,
                isEnabled: _isEmailValid && !isLoading,
              ),
              
              SizedBox(height: 32.h), // Responsive bottom padding
                ],
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }
}