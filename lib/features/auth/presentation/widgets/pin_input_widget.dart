import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Custom PIN input widget matching Figma design
class PinInputWidget extends StatefulWidget {
  const PinInputWidget({
    super.key,
    required this.length,
    required this.onChanged,
    this.onCompleted,
  });

  final int length;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;

  @override
  State<PinInputWidget> createState() => _PinInputWidgetState();
}

class _PinInputWidgetState extends State<PinInputWidget>
    with SingleTickerProviderStateMixin {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late AnimationController _animationController;
  String _currentPin = '';

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    // Add listeners to controllers
    for (int i = 0; i < widget.length; i++) {
      _controllers[i].addListener(() => _onTextChanged(i));
    }
    
    // Auto-focus first field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _animationController.dispose();
    super.dispose();
  }

  void _onTextChanged(int index) {
    final String value = _controllers[index].text;
    
    if (value.isNotEmpty) {
      _animationController.forward(from: 0);
      
      // Move to next field if not the last one
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // Last field, unfocus
        _focusNodes[index].unfocus();
      }
    }
    
    // Update current PIN
    _updateCurrentPin();
  }

  void _updateCurrentPin() {
    _currentPin = _controllers.map((c) => c.text).join();
    widget.onChanged(_currentPin);
    
    if (_currentPin.length == widget.length) {
      widget.onCompleted?.call(_currentPin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Find first empty field and focus it
        for (int i = 0; i < widget.length; i++) {
          if (_controllers[i].text.isEmpty) {
            _focusNodes[i].requestFocus();
            return;
          }
        }
        // If all filled, focus last
        _focusNodes[widget.length - 1].requestFocus();
      },
      child: Column(
        children: [
          // Visual indicators (lines)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.length, (index) {
              return AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: 23,
                    height: 3,
                    decoration: BoxDecoration(
                      color: _controllers[index].text.isNotEmpty 
                          ? AppColors.primary 
                          : const Color(0xFF454545), // Figma: #454545
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                  );
                },
              );
            }),
          ),
          
          const SizedBox(height: 8),
          
          // Hidden input fields stacked
          Stack(
            children: List.generate(widget.length, (index) {
              return Positioned(
                left: 0,
                right: 0,
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  autofocus: index == 0,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    if (value.isEmpty && index > 0) {
                      // Backspace - move to previous field
                      _focusNodes[index - 1].requestFocus();
                      _controllers[index - 1].selection = TextSelection.fromPosition(
                        TextPosition(offset: _controllers[index - 1].text.length),
                      );
                    }
                  },
                  decoration: const InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(
                    fontSize: 0,
                    color: Colors.transparent,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}