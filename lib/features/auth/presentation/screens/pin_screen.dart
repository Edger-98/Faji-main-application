import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';

// Haptic feedback helper
void _triggerHaptic() {
  HapticFeedback.lightImpact();
}

/// PIN verification screen - SIMPLE AND WORKING
class PinScreen extends ConsumerStatefulWidget {
  const PinScreen({super.key});

  @override
  ConsumerState<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends ConsumerState<PinScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  int _resendCountdown = 60;
  bool _canResend = false;
  bool _showPin = false;
  late AnimationController _successAnimationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _successAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _successAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _resendCountdown > 0) {
        setState(() {
          _resendCountdown--;
          if (_resendCountdown == 0) {
            _canResend = true;
          }
        });
        _startCountdown();
      }
    });
  }

  void _resendCode() {
    if (!_canResend) return;

    HapticFeedback.mediumImpact();
    setState(() {
      _canResend = false;
      _resendCountdown = 60;
    });
    _startCountdown();

    ToastService.showSuccess(
      context: context,
      message: 'Verification code sent!',
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _successAnimationController.dispose();
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pin = _pinController.text;

    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),

                    // Back button
                    GestureDetector(
                      onTap: () {
                        context.goNamed(RouteManager.authEmailName);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0x52282828),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    const Text(
                      'Enter 6-digit code',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: Color(0xFFF8F8F8),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'We sent a verification code to your email\nchineme@gmail.com',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w100,
                        height: 1.2,
                        color: Color(0xFFA1A1A1),
                      ),
                    ),

                    const SizedBox(height: 81),

                    // PIN INPUT
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: GestureDetector(
                        onTap: () {
                          _focusNode.requestFocus();
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Column(
                            children: [
                              // Show/Hide toggle
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      HapticFeedback.lightImpact();
                                      setState(() => _showPin = !_showPin);
                                    },
                                    child: Icon(
                                      _showPin ? Icons.visibility_off : Icons.visibility,
                                      color: const Color(0xFFA1A1A1),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Digits display
                              SizedBox(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: List.generate(6, (i) {
                                    return SizedBox(
                                      width: 23,
                                      child: Center(
                                        child: i < pin.length
                                            ? _showPin
                                                ? Text(
                                                    pin[i],
                                                    style: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.w500,
                                                      color: Color(0xFFF8F8F8),
                                                    ),
                                                  )
                                                : Container(
                                                    width: 8,
                                                    height: 8,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFFF8F8F8),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  )
                                            : const SizedBox(),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Visual lines
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: List.generate(6, (i) {
                                  return Container(
                                    width: 23,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: i < pin.length
                                          ? const Color(0xFFFD99C9)
                                          : const Color(0xFF454545),
                                      borderRadius: BorderRadius.circular(1.5),
                                    ),
                                  );
                                }),
                              ),

                              // Hidden input field
                              Opacity(
                                opacity: 0.01,
                                child: SizedBox(
                                  height: 50,
                                  child: TextField(
                                    controller: _pinController,
                                    focusNode: _focusNode,
                                    keyboardType: TextInputType.number,
                                    maxLength: 6,
                                    autofocus: true,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    onChanged: (value) {
                                      if (value.length > pin.length) {
                                        _triggerHaptic();
                                      }
                                      setState(() {});
                                      if (value.length == 6) {
                                        HapticFeedback.mediumImpact();
                                        _successAnimationController
                                            .forward()
                                            .then((_) {
                                          _successAnimationController.reverse();
                                        });
                                        Future.delayed(
                                            const Duration(milliseconds: 400),
                                                () {
                                              if (mounted) {
                                                context.goNamed(
                                                    RouteManager.authNameName);
                                              }
                                            });
                                      }
                                    },
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 48),

                    // Resend link
                    TextButton(
                      onPressed: _canResend ? _resendCode : null,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w100,
                            height: 1.2,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Didn\'t receive code? ',
                              style: TextStyle(color: Color(0xFFA1A1A1)),
                            ),
                            TextSpan(
                              text: _canResend
                                  ? 'Request again'
                                  : 'Request again ($_resendCountdown s)',
                              style: TextStyle(
                                color: _canResend
                                    ? const Color(0xFFFD99C9)
                                    : const Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),

                    // Continue button
                    GestureDetector(
                      onTap: pin.length == 6
                          ? () => context.goNamed(RouteManager.authNameName)
                          : null,
                      child: Container(
                        width: double.infinity,
                        height: 59,
                        decoration: BoxDecoration(
                          color: pin.length == 6
                              ? const Color(0xFFFD99C9)
                              : const Color(0xFFFD99C9).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(29.5),
                        ),
                        child: const Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F1F1F),
                            ),
                          ),
                        ),
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
    );
  }
}
