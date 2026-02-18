import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class FeatureTooltip extends StatefulWidget {

  const FeatureTooltip({
    super.key,
    required this.child,
    required this.message,
    this.featureKey,
    this.showOnFirstTime = true,
  });
  final Widget child;
  final String message;
  final String? featureKey;
  final bool showOnFirstTime;

  @override
  State<FeatureTooltip> createState() => _FeatureTooltipState();
}

class _FeatureTooltipState extends State<FeatureTooltip> {
  bool _showTooltip = false;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    if (widget.showOnFirstTime) {
      // In a real app, check SharedPreferences
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showTooltipOverlay();
      });
    }
  }

  void _showTooltipOverlay() {
    if (_overlayEntry != null) return;

    final RenderBox renderBox = context.findRenderObject()! as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: position.dx,
        top: position.dy + size.height + 8.h,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: _hideTooltip,
            child: Container(
              constraints: BoxConstraints(maxWidth: 250.w),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      widget.message,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.onSurface,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.close,
                    size: 16.sp,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _showTooltip = true);

    // Auto-hide after 5 seconds
    Future.delayed(const Duration(seconds: 5), _hideTooltip);
  }

  void _hideTooltip() {
    HapticFeedback.lightImpact();
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) {
      setState(() => _showTooltip = false);
    }
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
