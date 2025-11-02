import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_button.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/back_button_widget.dart';

/// Phone number input screen matching Figma design (node-id=2-481)
class PhoneScreen extends ConsumerStatefulWidget {
  const PhoneScreen({super.key});

  @override
  ConsumerState<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends ConsumerState<PhoneScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  bool _isPhoneValid = false;
  Country _selectedCountry = Country(
    phoneCode: '84',
    countryCode: 'VN',
    e164Sc: 84,
    geographic: true,
    level: 1,
    name: 'Vietnam',
    example: '912345678',
    displayName: 'Vietnam (VN) [+84]',
    displayNameNoCountryCode: 'Vietnam (VN)',
    e164Key: '84-VN-0',
  );
  
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validatePhone);
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
    _phoneController.removeListener(_validatePhone);
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _validatePhone() {
    final phone = _phoneController.text;
    final isValid = phone.isNotEmpty && phone.length >= 8;
    if (isValid != _isPhoneValid) {
      setState(() {
        _isPhoneValid = isValid;
      });
    }
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.circular(16),
        backgroundColor: context.colors.surface,
        textStyle: TextStyle(
          fontFamily: AppTypography.ppNeueMontreal,
          fontSize: 16,
          color: context.colors.onSurface,
        ),
        searchTextStyle: TextStyle(
          fontFamily: AppTypography.ppNeueMontreal,
          fontSize: 16,
          color: context.colors.onSurface,
        ),
        inputDecoration: InputDecoration(
          hintText: 'Search country',
          hintStyle: TextStyle(
            fontFamily: AppTypography.ppNeueMontreal,
            color: context.colors.onSurfaceVariant,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: context.colors.onSurfaceVariant,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: context.colors.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: context.colors.primary, width: 2),
          ),
        ),
      ),
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        const SizedBox(height: 40),
                        
                        // Back button
                        const BackButtonWidget(),
                        
                        const SizedBox(height: 32),
                        
                        // Title
                        Text(
                          'Add your phone',
                          style: const TextStyle(
                            fontFamily: AppTypography.neueHaasDisplay,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            letterSpacing: 0,
                          ).copyWith(
                            color: context.colors.onSurface,
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Subtitle
                        Text(
                          'Enter your phone number to get yourself \nverified and increase account security.',
                          style: const TextStyle(
                            fontFamily: AppTypography.ppNeueMontreal,
                            fontSize: 17,
                            fontWeight: FontWeight.w100,
                            height: 1.2,
                            letterSpacing: 0,
                          ).copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Phone input field with country picker
                        AppTextField(
                          hintText: 'Phone Number',
                          controller: _phoneController,
                          focusNode: _phoneFocusNode,
                          keyboardType: TextInputType.phone,
                          prefixWidget: InkWell(
                            onTap: _showCountryPicker,
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Country flag
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: context.colors.outline.withOpacity(0.3),
                                        width: 1,
                                      ),
                                    ),
                                    child: ClipOval(
                                      child: Center(
                                        child: Text(
                                          _selectedCountry.flagEmoji,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  // Country code
                                  Text(
                                    '+${_selectedCountry.phoneCode}',
                                    style: context.styles.titleMedium.copyWith(
                                      color: context.colors.onSurface,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: context.colors.onSurfaceVariant,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        
                        const Spacer(),
                        
                        // Continue button with animation
                        AnimatedOpacity(
                          opacity: _isPhoneValid ? 1.0 : 0.5,
                          duration: const Duration(milliseconds: 300),
                          child: AuthButton(
                            text: 'Continue',
                            height: 59,
                            onPressed: () {
                              if (_isPhoneValid) {
                                debugPrint('Phone screen: Navigating to PIN screen');
                                debugPrint('Route name: ${RouteManager.authPinName}');
                                debugPrint('Route path: ${RouteManager.authPin}');
                                try {
                                  context.goNamed(RouteManager.authPinName);
                                  debugPrint('Navigation called successfully');
                                } catch (e) {
                                  debugPrint('Navigation error: $e');
                                  // Fallback to path-based navigation
                                  context.go(RouteManager.authPin);
                                }
                              }
                            },
                            isEnabled: _isPhoneValid,
                          ),
                        ),
                        
                        const SizedBox(height: 32),
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
}