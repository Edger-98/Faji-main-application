import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_creation_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/viewmodels/event_creation_viewmodel.dart';
import 'package:fajimobileapp/features/organize_event/presentation/widgets/step_progress_indicator.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart' as events_providers;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';

/// Step 3: Event Location Picker Screen
class EventLocationPickerScreen extends ConsumerStatefulWidget {
  const EventLocationPickerScreen({super.key});

  @override
  ConsumerState<EventLocationPickerScreen> createState() =>
      _EventLocationPickerScreenState();
}

class _EventLocationPickerScreenState
    extends ConsumerState<EventLocationPickerScreen> {
  GoogleMapController? _mapController;
  LatLng _selectedLocation = const LatLng(37.7749, -122.4194); // Default: San Francisco
  String _selectedAddress = '';
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  Set<Marker> _markers = {};

  @override
  void dispose() {
    _mapController?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _updateMarker(_selectedLocation);
  }

  void _updateMarker(LatLng position) {
    setState(() {
      _selectedLocation = position;
      _markers = {
        Marker(
          markerId: const MarkerId('selected_location'),
          position: position,
          draggable: true,
          onDragEnd: (LatLng newPosition) {
            _onLocationSelected(newPosition);
          },
        ),
      };
    });
    _getAddressFromLatLng(position);
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      
      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks[0];
        setState(() {
          _selectedAddress = '${place.street}, ${place.locality}, ${place.country}';
        });
      }
    } catch (e) {
      print('Error getting address: $e');
      setState(() {
        _selectedAddress = 'Lat: ${position.latitude.toStringAsFixed(4)}, '
            'Lng: ${position.longitude.toStringAsFixed(4)}';
      });
    }
  }

  Future<void> _searchLocation() async {
    final String query = _searchController.text.trim();
    if (query.isEmpty) return;

    setState(() => _isSearching = true);

    try {
      final List<Location> locations = await locationFromAddress(query);
      
      if (locations.isNotEmpty) {
        final Location location = locations[0];
        final LatLng newPosition = LatLng(location.latitude, location.longitude);
        
        _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(newPosition, 15),
        );
        
        _onLocationSelected(newPosition);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Location not found'),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error searching location: $e'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        );
      }
    } finally {
      setState(() => _isSearching = false);
    }
  }

  void _onLocationSelected(LatLng position) {
    _updateMarker(position);
  }

  void _handleNext() {
    final EventCreationViewModel viewModel =
        ref.read(eventCreationViewModelProvider.notifier);

    // Save location data
    viewModel.updateLocationData(
      address: _selectedAddress,
      latitude: _selectedLocation.latitude,
      longitude: _selectedLocation.longitude,
    );

    // Proceed to create event (this is now the final step)
    _createEvent();
  }

  Future<void> _createEvent() async {
    // Implementation moved from EventConfigScreen
    // This will be the final step that creates the event
    final EventCreationViewModel viewModel =
        ref.read(eventCreationViewModelProvider.notifier);
    final EventCreationState state = ref.read(eventCreationViewModelProvider);

    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Center(
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: AppColors.primary),
              SizedBox(height: 16.h),
              Text(
                'Creating your event...',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 16.sp,
                  color: AppColors.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    try {
      final DateTime? startDate = state.eventData.eventDate;
      DateTime? endDate;
      if (state.eventData.eventTime != null) {
        try {
          endDate = DateTime.parse(state.eventData.eventTime!);
        } catch (e) {
          endDate = startDate?.add(const Duration(hours: 3));
        }
      }

      final String? websiteLink = state.eventData.location;

      final createdEvent = await viewModel.createEvent(
        startDate: startDate,
        endDate: endDate,
        websiteLink: websiteLink,
        rsvpButtonText: 'Celebrate With Us',
      );

      if (!mounted) return;

      Navigator.of(context).pop(); // Close loading dialog

      if (createdEvent != null) {
        // Invalidate event providers (will auto-refetch when needed)
        ref.invalidate(filteredEventsProvider);
        ref.invalidate(events_providers.userEventsProvider);
        
        // Reset event creation state for next time
        ref.read(eventCreationViewModelProvider.notifier).reset();
        
        // Navigate to success screen with created event data
        if (mounted) {
          context.pushReplacement(
            RouteManager.eventCreationSuccess,
            extra: createdEvent,
          );
        }
      } else {
        final String? error = state.error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error ?? 'Failed to create event'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      
      Navigator.of(context).pop(); // Close loading dialog
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
    }
  }

  void _handlePrevious() {
    ref.read(eventCreationViewModelProvider.notifier).previousStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button and progress
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHighest.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, size: 18.sp),
                      color: AppColors.onSurface,
                      padding: EdgeInsets.zero,
                      onPressed: _handlePrevious,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  const Expanded(
                    child: StepProgressIndicator(
                      currentStep: 3,
                      totalSteps: 4,
                    ),
                  ),
                ],
              ),
            ),

            // Title Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Where\'s the\nparty at?',
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
                    'Search, pin, or drag to select your event location',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.onSurfaceVariant.withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: const Color(0xFF3A3A3A),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.onSurfaceVariant,
                      size: 20.sp,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 15.sp,
                          color: AppColors.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search for a location...',
                          hintStyle: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 15.sp,
                            color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                        onSubmitted: (_) => _searchLocation(),
                      ),
                    ),
                    if (_isSearching)
                      SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary,
                        ),
                      )
                    else
                      IconButton(
                        icon: Icon(
                          Icons.my_location,
                          color: AppColors.primary,
                          size: 20.sp,
                        ),
                        onPressed: _searchLocation,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Map
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _selectedLocation,
                      zoom: 13,
                    ),
                    markers: _markers,
                    onTap: _onLocationSelected,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Selected Address Display
            if (_selectedAddress.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          _selectedAddress,
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 14.sp,
                            color: AppColors.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 16.h),

            // Bottom Navigation
            Container(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
              decoration: BoxDecoration(
                color: AppColors.background,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _handlePrevious,
                      child: Container(
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHighest.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(28.r),
                        ),
                        child: Center(
                          child: Text(
                            'Previous',
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
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: _handleNext,
                      child: Container(
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(28.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Create Event',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
