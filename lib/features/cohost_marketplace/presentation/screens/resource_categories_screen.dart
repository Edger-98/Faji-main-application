import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/resource_category.dart';
import 'package:fajimobileapp/features/cohost_marketplace/presentation/screens/cohost_list_screen.dart';

/// Screen for selecting resource categories when creating an event
class ResourceCategoriesScreen extends StatefulWidget {
  const ResourceCategoriesScreen({
    this.eventId,
    super.key,
  });

  final String? eventId;

  @override
  State<ResourceCategoriesScreen> createState() => _ResourceCategoriesScreenState();
}

class _ResourceCategoriesScreenState extends State<ResourceCategoriesScreen>
    with TickerProviderStateMixin {
  final Set<ResourceCategory> _selectedCategories = <ResourceCategory>{};
  late List<AnimationController> _controllers;
  late List<Animation<double>> _scaleAnimations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      ResourceCategory.values.length,
      (int index) => AnimationController(
        duration: const Duration(milliseconds: 150),
        vsync: this,
      ),
    );
    _scaleAnimations = _controllers
        .map((AnimationController controller) => Tween<double>(begin: 1, end: 0.95).animate(
              CurvedAnimation(parent: controller, curve: Curves.easeInOut),
            ))
        .toList();
  }

  @override
  void dispose() {
    for (AnimationController controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _toggleCategory(ResourceCategory category) {
    final int index = ResourceCategory.values.indexOf(category);
    _controllers[index].forward().then((_) => _controllers[index].reverse());
    
    setState(() {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
    });
  }

  void _handleContinue() {
    if (_selectedCategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select at least one category'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
      return;
    }

    // Show options: Browse vendors or Skip
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (BuildContext context) => Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'What would you like to do?',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
            SizedBox(height: 24.h),
            
            // Browse vendors button
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                final firstCategory = _selectedCategories.first;
                // Navigate to cohost list with eventId
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CohostListScreen(
                      category: firstCategory,
                      eventId: widget.eventId,
                    ),
                  ),
                ).then((_) {
                  // After browsing vendors, go back and continue event creation
                  Navigator.pop(context);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  child: Text(
                    'Browse Vendors Now',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            
            // Skip and continue button
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close bottom sheet
                Navigator.pop(context); // Go back to event config screen
                // The event config screen will automatically continue to next step
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color(0xFF3A3A3A),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Skip for Now & Continue',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Row(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: const BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      color: AppColors.onSurface,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'What do you\nneed help with?',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 42.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onSurface,
                      height: 1.1,
                      letterSpacing: -1.2,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Pick the services you need to make your event\nunforgettable. You can select multiple.',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.onSurfaceVariant.withOpacity(0.8),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // Categories grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14.w,
                      mainAxisSpacing: 14.h,
                      childAspectRatio: 0.95,
                    ),
                    itemCount: ResourceCategory.values.length,
                    itemBuilder: (context, index) {
                      final ResourceCategory category = ResourceCategory.values[index];
                      final bool isSelected = _selectedCategories.contains(category);

                      return ScaleTransition(
                        scale: _scaleAnimations[index],
                        child: GestureDetector(
                          onTap: () => _toggleCategory(category),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            padding: EdgeInsets.all(18.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(24.r),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : const Color(0xFF3A3A3A),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Icon container
                                Container(
                                  padding: EdgeInsets.all(12.w),
                                  decoration: BoxDecoration(
                                    color: category.color.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Icon(
                                    category.iconData,
                                    color: category.color,
                                    size: 28.sp,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                
                                // Category name
                                Text(
                                  category.displayName,
                                  style: TextStyle(
                                    fontFamily: AppTypography.modicaPro,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.onSurface,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6.h),
                                
                                // Description
                                Flexible(
                                  child: Text(
                                    category.description,
                                    style: TextStyle(
                                      fontFamily: AppTypography.modicaPro,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.onSurfaceVariant.withOpacity(0.7),
                                      height: 1.3,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                
                                // Selection indicator
                                if (isSelected) ...[
                                  SizedBox(height: 8.h),
                                  Icon(
                                    Icons.check_circle,
                                    color: AppColors.primary,
                                    size: 20.sp,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 40.h),

                  // Continue button
                  GestureDetector(
                    onTap: _handleContinue,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 64.h,
                      decoration: BoxDecoration(
                        color: _selectedCategories.isEmpty
                            ? const Color(0xFF2A2A2A)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(32.r),
                        border: Border.all(
                          color: _selectedCategories.isEmpty
                              ? const Color(0xFF3A3A3A)
                              : Colors.white,
                          width: 1.5,
                        ),
                        boxShadow: _selectedCategories.isNotEmpty
                            ? [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  blurRadius: 16,
                                  offset: const Offset(0, 6),
                                ),
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _selectedCategories.isEmpty
                                  ? 'Select at least one'
                                  : 'Continue with ${_selectedCategories.length} ${_selectedCategories.length == 1 ? "service" : "services"}',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: _selectedCategories.isEmpty
                                    ? AppColors.onSurfaceVariant.withOpacity(0.5)
                                    : Colors.black,
                              ),
                            ),
                            if (_selectedCategories.isNotEmpty) ...[
                              SizedBox(width: 8.w),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.black,
                                size: 20.sp,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
}
