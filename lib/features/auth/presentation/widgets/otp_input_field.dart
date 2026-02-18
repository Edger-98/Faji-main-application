import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/core.dart';

/// OTP input field for 6-digit codes
class OtpInputField extends StatefulWidget {
  
  const OtpInputField({
    required this.controller,
    this.enabled = true,
    this.onCompleted,
    super.key,
  });
  final TextEditingController controller;
  final bool enabled;
  final Function(String)? onCompleted;

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  final int _pinLength = 6;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_pinLength, (_) => TextEditingController());
    _focusNodes = List.generate(_pinLength, (_) => FocusNode());
    
    // Listen to main controller changes
    widget.controller.addListener(_updateFromMainController);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateFromMainController);
    for (final TextEditingController controller in _controllers) {
      controller.dispose();
    }
    for (final FocusNode node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _updateFromMainController() {
    final String text = widget.controller.text;
    for (var i = 0; i < _pinLength; i++) {
      if (i < text.length) {
        _controllers[i].text = text[i];
      } else {
        _controllers[i].clear();
      }
    }
  }

  void _onChanged(String value, int index) {
    // Update main controller
    final String currentPin = _controllers.map((TextEditingController c) => c.text).join();
    widget.controller.text = currentPin;
    
    if (value.isNotEmpty && index < _pinLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    
    // Check if completed
    if (currentPin.length == _pinLength) {
      widget.onCompleted?.call(currentPin);
    }
  }

  void _onBackspace(int index) {
    if (index > 0) {
      _controllers[index - 1].clear();
      _focusNodes[index - 1].requestFocus();
      
      // Update main controller
      final String currentPin = _controllers.map((TextEditingController c) => c.text).join();
      widget.controller.text = currentPin;
    }
  }

  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(_pinLength, (index) {
        return SizedBox(
          width: 50.w,
          height: 60.h,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            enabled: widget.enabled,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: context.colors.onSurface,
            ),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: context.colors.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.colors.outline,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.colors.outline,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.colors.primary,
                  width: 2,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.colors.outline.withOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) => _onChanged(value, index),
            onTap: () {
              // Clear current field on tap
              _controllers[index].clear();
            },
            onEditingComplete: () {
              if (index < _pinLength - 1) {
                _focusNodes[index + 1].requestFocus();
              }
            },
            onSubmitted: (_) {
              if (index < _pinLength - 1) {
                _focusNodes[index + 1].requestFocus();
              }
            },
            textInputAction: index == _pinLength - 1
                ? TextInputAction.done
                : TextInputAction.next,
          ),
        );
      }),
    );
}
