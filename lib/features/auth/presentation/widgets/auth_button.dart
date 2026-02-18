import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Primary button component matching Figma design system
class AuthButton extends StatefulWidget {
  const AuthButton({
    required this.text, required this.onPressed, super.key,
    this.isEnabled = true,
    this.width,
    this.height = 59,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final double? width;
  final double height;

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.isEnabled) {
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.isEnabled) {
      _animationController.reverse();
    }
  }

  void _onTapCancel() {
    if (widget.isEnabled) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            child: Container(
              width: widget.width ?? double.infinity,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.isEnabled 
                    ? context.colors.primary 
                    : context.colors.onSurfaceVariant,
                borderRadius: BorderRadius.circular(widget.height / 2),
                boxShadow: widget.isEnabled ? [
                  BoxShadow(
                    color: context.colors.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ] : null,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(widget.height / 2),
                  onTap: widget.isEnabled ? widget.onPressed : null,
                  child: Center(
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 18.sp, // Responsive font size from Figma
                        fontWeight: FontWeight.w600, // EXACT from Figma
                        height: 1.2,
                        letterSpacing: 0,
                        color: context.colors.surface,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
}