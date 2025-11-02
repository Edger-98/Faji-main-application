import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';

/// PIN verification screen - SIMPLE AND WORKING
class PinScreen extends ConsumerStatefulWidget {
  const PinScreen({super.key});

  @override
  ConsumerState<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends ConsumerState<PinScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
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
                    
                    // Back button - goes to Email screen
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
                    
                    // PIN INPUT - Shows digits above lines
                    GestureDetector(
                      onTap: () {
                        _focusNode.requestFocus();
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: Column(
                          children: [
                            // Digits display - show bullets
                            SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(6, (i) {
                                  return SizedBox(
                                    width: 23,
                                    child: Center(
                                      child: i < pin.length
                                          ? Container(
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
                            // Visual lines - Figma: 6 lines, 23px wide, 3px tall
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    setState(() {});
                                    if (value.length == 6) {
                                      Future.delayed(const Duration(milliseconds: 300), () {
                                        if (mounted) {
                                          context.goNamed(RouteManager.authNameName);
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
                    
                    const SizedBox(height: 48),
                    
                    // Resend link
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Verification code sent!'),
                            backgroundColor: Color(0xFFFD99C9),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w100,
                            height: 1.2,
                          ),
                          children: [
                            TextSpan(
                              text: 'Didn\'t receive code? ',
                              style: TextStyle(color: Color(0xFFA1A1A1)),
                            ),
                            TextSpan(
                              text: 'Request again',
                              style: TextStyle(color: Color(0xFFFD99C9)),
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