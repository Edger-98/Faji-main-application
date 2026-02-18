import 'package:fajimobileapp/core/network/api_result.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/booking_entity.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/cohost_resource_entity.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/resource_category.dart';
import 'package:fajimobileapp/features/cohost_marketplace/data/datasources/marketplace_api_service.dart';
import 'package:fajimobileapp/features/cohost_marketplace/data/models/booking_model.dart';
import 'package:retrofit/dio.dart';

/// Repository for marketplace operations
class MarketplaceRepository {

  MarketplaceRepository(this._apiService);
  final MarketplaceApiService _apiService;

  /// Get vendors for an event by category
  Future<ApiResult<List<CohostResourceEntity>>> getVendorsForEvent({
    required String eventId,
    required ResourceCategory category,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      print('🔍 Fetching vendors for event: $eventId, category: ${category.name}');
      print('📄 Page: $page, Limit: $limit');
      
      final HttpResponse response = await _apiService.getVendorsForEvent(
        eventId,
        category.name,
        page,
        limit,
      );

      print('📡 Response status: ${response.response.statusCode}');
      print('📦 Response data: ${response.data}');

      if (response.response.statusCode == 200) {
        final responseData = response.data;
        
        // Handle nested structure: data.vendors
        final Map<String, dynamic>? dataObject = responseData['data'] as Map<String, dynamic>?;
        final List vendorsList = dataObject?['vendors'] as List<dynamic>? ?? <dynamic>[];
        
        print('✅ Found ${vendorsList.length} vendors');
        
        // Parse vendors from API response
        final List<CohostResourceEntity> resources = vendorsList.map((vendorJson) {
          final Map<String, dynamic> vendor = vendorJson as Map<String, dynamic>;
          
          // Get first resource from vendor's resources array
          final List vendorResources = vendor['resources'] as List<dynamic>? ?? <dynamic>[];
          final Map<String, dynamic> firstResource = vendorResources.isNotEmpty 
              ? vendorResources[0] as Map<String, dynamic>
              : <String, dynamic>{};
          
          return CohostResourceEntity(
            id: firstResource['id'] ?? vendor['id'] ?? '',
            cohostId: vendor['id'] ?? '',
            cohostName: vendor['name'] ?? '',
            category: category,
            title: firstResource['title'] ?? '${vendor['name']} Services',
            description: vendor['bio'] ?? '',
            photos: (vendor['portfolio'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ?? <String>[],
            basePrice: (firstResource['basePrice'] as num?)?.toDouble() ?? 0.0,
            isAvailable: true,
            rating: (vendor['rating'] as num?)?.toDouble() ?? 0.0,
            reviewCount: vendor['reviewCount'] as int? ?? 0,
            profilePhoto: vendor['profilePhoto'] as String?,
            eventsCompleted: vendor['eventsCompleted'] as int? ?? 0,
            isVerified: vendor['isVerified'] as bool? ?? false,
          );
        }).toList();
        
        return ApiResult.success(resources);
      } else {
        print('❌ Failed to fetch vendors: Status ${response.response.statusCode}');
        return ApiResult.failure('Failed to fetch vendors: ${response.response.statusMessage}');
      }
    } catch (e, stackTrace) {
      print('💥 Exception in getVendorsForEvent: $e');
      print('Stack trace: $stackTrace');
      return ApiResult.failure('Error: ${e}');
    }
  }
  
  /// Get resources by category (general marketplace, no event context)
  Future<ApiResult<List<CohostResourceEntity>>> getResourcesByCategory({
    required ResourceCategory category,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      print('🔍 Fetching resources for category: ${category.name}');
      print('📄 Page: $page, Limit: $limit');
      
      final HttpResponse response = await _apiService.getResourcesByCategory(
        category.name,
        page,
        limit,
      );

      print('📡 Response status: ${response.response.statusCode}');
      print('📦 Response data: ${response.data}');

      if (response.response.statusCode == 200) {
        final responseData = response.data;
        
        // Handle nested structure: data.vendors
        final Map<String, dynamic>? dataObject = responseData['data'] as Map<String, dynamic>?;
        final List vendorsList = dataObject?['vendors'] as List<dynamic>? ?? <dynamic>[];
        
        print('✅ Found ${vendorsList.length} vendors');
        
        // Parse vendors from API response
        final List<CohostResourceEntity> resources = vendorsList.map((vendorJson) {
          final Map<String, dynamic> vendor = vendorJson as Map<String, dynamic>;
          
          // Get first resource from vendor's resources array
          final List vendorResources = vendor['resources'] as List<dynamic>? ?? <dynamic>[];
          final Map<String, dynamic> firstResource = vendorResources.isNotEmpty 
              ? vendorResources[0] as Map<String, dynamic>
              : <String, dynamic>{};
          
          return CohostResourceEntity(
            id: firstResource['id'] ?? vendor['id'] ?? '',
            cohostId: vendor['id'] ?? '',
            cohostName: vendor['name'] ?? '',
            category: category,
            title: firstResource['title'] ?? '${vendor['name']} Services',
            description: vendor['bio'] ?? '',
            photos: (vendor['portfolio'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ?? <String>[],
            basePrice: (firstResource['basePrice'] as num?)?.toDouble() ?? 0.0,
            isAvailable: true,
            rating: (vendor['rating'] as num?)?.toDouble() ?? 0.0,
            reviewCount: vendor['reviewCount'] as int? ?? 0,
            profilePhoto: vendor['profilePhoto'] as String?,
            eventsCompleted: vendor['eventsCompleted'] as int? ?? 0,
            isVerified: vendor['isVerified'] as bool? ?? false,
          );
        }).toList();
        
        return ApiResult.success(resources);
      } else {
        print('❌ Failed to fetch resources: Status ${response.response.statusCode}');
        return ApiResult.failure('Failed to fetch resources: ${response.response.statusMessage}');
      }
    } catch (e, stackTrace) {
      print('💥 Exception in getResourcesByCategory: $e');
      print('Stack trace: $stackTrace');
      return ApiResult.failure('Error: ${e}');
    }
  }

  /// Create booking request
  Future<ApiResult<BookingEntity>> createBooking({
    required String eventId,
    required String cohostId,
    required String resourceId,
    required PaymentOption paymentOption,
    required double offeredPrice,
    double? percentageSplit,
    String? message,
    DateTime? eventDate,
  }) async {
    try {
      final Map<String, Object> bookingData = <String, Object>{
        'eventId': eventId,
        'vendorId': cohostId, // Backend uses vendorId
        'resourceId': resourceId,
        'paymentOption': paymentOption == PaymentOption.ticketSalesSplit 
            ? 'ticketSalesSplit' 
            : 'upfrontPayment',
        'offeredPrice': offeredPrice,
        if (percentageSplit != null) 'percentageSplit': percentageSplit,
        if (message != null) 'message': message,
        if (eventDate != null) 'eventDate': eventDate.toIso8601String(),
      };

      final HttpResponse response = await _apiService.createBooking(bookingData);

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        final Map<String, dynamic> data = response.data['data'] as Map<String, dynamic>;
        final BookingModel bookingModel = BookingModel.fromJson(data);
        return ApiResult.success(bookingModel.toEntity());
      } else {
        return ApiResult.failure('Failed to create booking');
      }
    } catch (e) {
      return ApiResult.failure('Error: ${e}');
    }
  }

  /// Get user's bookings (as host)
  Future<ApiResult<List<BookingEntity>>> getMyBookings({
    BookingStatus? status,
  }) async {
    try {
      final HttpResponse response = await _apiService.getMyBookings(
        status?.name,
      );

      if (response.response.statusCode == 200) {
        final data = response.data;
        final List bookingsList = data['data'] as List<dynamic>? ?? <dynamic>[];
        
        final List<BookingEntity> bookings = bookingsList
            .map((json) => BookingModel.fromJson(json as Map<String, dynamic>).toEntity())
            .toList();
        
        return ApiResult.success(bookings);
      } else {
        return ApiResult.failure('Failed to fetch bookings');
      }
    } catch (e) {
      return ApiResult.failure('Error: ${e}');
    }
  }

  /// Accept booking (vendor side)
  Future<ApiResult<BookingEntity>> acceptBooking({
    required String bookingId,
    double? counterOffer,
  }) async {
    try {
      final HttpResponse response = await _apiService.acceptBooking(bookingId);

      if (response.response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['data'] as Map<String, dynamic>;
        final BookingModel bookingModel = BookingModel.fromJson(data);
        return ApiResult.success(bookingModel.toEntity());
      } else {
        return ApiResult.failure('Failed to accept booking');
      }
    } catch (e) {
      return ApiResult.failure('Error: ${e}');
    }
  }

  /// Decline booking (vendor side)
  Future<ApiResult<bool>> declineBooking({
    required String bookingId,
    String? reason,
  }) async {
    try {
      final HttpResponse response = await _apiService.declineBooking(bookingId);

      if (response.response.statusCode == 200) {
        return ApiResult.success(true);
      } else {
        return ApiResult.failure('Failed to decline booking');
      }
    } catch (e) {
      return ApiResult.failure('Error: ${e}');
    }
  }
}
