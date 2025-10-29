import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_button.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/back_button_widget.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/pin_input_widget.dart';

/// PIN verification screen matching Figma design (node-id=2-455)
class PinScreen extends ConsumerStatefulWidget {
  const PinScreen({super.key});

  @override
  ConsumerState<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends ConsumerState<PinScreen> {
  String _currentPin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w), // Responsive padding
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
                children: [
              SizedBox(height: 40.h), // Responsive spacing
              
              // Back button - positioned at x: 24, y: 64
              const BackButtonWidget(),
              
              SizedBox(height: 32.h), // Responsive spacing
              
              // Title
              AppText.headlineLarge(
                'Enter 6-digit code',
                color: context.colors.onSurface,
              ),
              
              SizedBox(height: 16.h), // Responsive spacing
              
              // Subtitle
              AppText.bodyLarge(
                'We sent a verification code to your email\nchineme@gmail.com',
                color: context.colors.onSurfaceVariant,
              ),
              
              SizedBox(height: 48.h), // Responsive spacing
              
              // PIN input fields - positioned at x: 40, y: 281
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PinInputWidget(
                  length: 6,
                  onChanged: (pin) {
                    setState(() {
                      _currentPin = pin;
                    });
                  },
                  onCompleted: (pin) {
                    // Auto-continue when PIN is complete
                    context.goNamed(RouteManager.authPhoneName);
                  },
                ),
              ),
              
              const SizedBox(height: 32), // Reduced spacing
              
              // Resend code link
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Resend code logic - show feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Verification code sent!'),
                        backgroundColor: context.colors.primary,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: context.styles.bodyLarge.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w100,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(
                          text: 'Didn\'t receive code? ',
                          style: TextStyle(color: context.colors.onSurfaceVariant),
                        ),
                        TextSpan(
                          text: 'Request again',
                          style: TextStyle(color: context.colors.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Continue button
              AuthButton(
                text: 'Continue',
                height: 59,
                onPressed: () {
                  if (_currentPin.length == 6) {
                    context.goNamed(RouteManager.authPhoneName);
                  }
                },
                isEnabled: _currentPin.length == 6,
              ),
              
              const SizedBox(height: 32), // Bottom padding
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