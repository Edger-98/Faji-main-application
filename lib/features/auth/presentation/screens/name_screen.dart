import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/registration_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_button.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/back_button_widget.dart';

/// Name input screen matching Figma design (node-id=2-528)
class NameScreen extends ConsumerStatefulWidget {
  const NameScreen({super.key});

  @override
  ConsumerState<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends ConsumerState<NameScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  bool _isFormValid = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_validateForm);
    _lastNameController.addListener(_validateForm);
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _firstNameController.removeListener(_validateForm);
    _lastNameController.removeListener(_validateForm);
    _firstNameController.dispose();
    _lastNameController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid = _firstNameController.text.trim().isNotEmpty &&
        _lastNameController.text.trim().isNotEmpty;
    if (isValid != _isFormValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final registrationState = ref.watch(registrationViewModelProvider);
    final isLoading = registrationState.stepState.maybeWhen(
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
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),

                        // Back button - positioned at x: 24, y: 64
                        const BackButtonWidget(),

                        SizedBox(height: 32.h),

                        // Title - positioned at x: 28, y: 126
                        Text(
                          'What is your name?',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            letterSpacing: 0,
                            color: context.colors.onSurface,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        // Subtitle - positioned at x: 28, y: 160
                        Text(
                          'What do your friend call you?',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w100,
                            height: 1.2,
                            letterSpacing: 0,
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),

                        SizedBox(height: 47.h), // 227 - 180 = 47

                        // First name input - positioned at x: 24, y: 227
                        AppTextField(
                          hintText: 'First name',
                          controller: _firstNameController,
                          focusNode: _firstNameFocusNode,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          onSubmitted: (_) {
                            _lastNameFocusNode.requestFocus();
                          },
                        ),

                        SizedBox(height: 12.h), // 308 - 296 = 12

                        // Last name input - positioned at x: 24, y: 308
                        AppTextField(
                          hintText: 'Last name',
                          controller: _lastNameController,
                          focusNode: _lastNameFocusNode,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          onSubmitted: (_) {
                            if (_isFormValid) {
                              _handleContinue();
                            }
                          },
                        ),

                        const Spacer(),

                        // Continue button - positioned at x: 24, y: 717
                        AnimatedOpacity(
                          opacity: _isFormValid && !isLoading ? 1.0 : 0.5,
                          duration: const Duration(milliseconds: 300),
                          child: AuthButton(
                            text: isLoading ? 'Saving...' : 'Continue',
                            height: 59.h,
                            onPressed: (_isFormValid && !isLoading) ? _handleContinue : null,
                            isEnabled: _isFormValid && !isLoading,
                          ),
                        ),

                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleContinue() async {
    if (!_isFormValid) return;
    
    FocusScope.of(context).unfocus();
    
    // Call the registration viewmodel
    await ref.read(registrationViewModelProvider.notifier).addName(
      _firstNameController.text.trim(),
      _lastNameController.text.trim(),
    );
    
    // Check the result
    final state = ref.read(registrationViewModelProvider);
    state.stepState.when(
      initial: () {},
      loading: () {},
      success: (_) {
        // Navigate to password screen
        context.goNamed(RouteManager.authPasswordName);
      },
      error: (failure) {
        // Show error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message)),
        );
      },
    );
  }
}
