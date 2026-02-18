import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Event search bar widget
class EventSearchBar extends StatefulWidget {

  const EventSearchBar({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.controller,
    this.autofocus = false,
  });
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onClear;
  final TextEditingController? controller;
  final bool autofocus;

  @override
  State<EventSearchBar> createState() => _EventSearchBarState();
}

class _EventSearchBarState extends State<EventSearchBar> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onTextChanged() {
    final bool hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
    widget.onChanged?.call(_controller.text);
  }

  void _clear() {
    _controller.clear();
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) => Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: context.colors.outline.withOpacity(0.2),
        ),
      ),
      child: TextField(
        controller: _controller,
        autofocus: widget.autofocus,
        onSubmitted: widget.onSubmitted,
        style: AppTypography.bodyLarge.copyWith(
          color: context.colors.onSurface,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'Search events...',
          hintStyle: AppTypography.bodyLarge.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: context.colors.onSurfaceVariant,
            size: 20.sp,
          ),
          suffixIcon: _hasText
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: context.colors.onSurfaceVariant,
                    size: 20.sp,
                  ),
                  onPressed: _clear,
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
      ),
    );
}
