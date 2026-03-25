import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/marketplace_resource.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_profile.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/booking.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/counter_offer.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_stats.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_dashboard.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';
import 'package:fajimobileapp/features/marketplace/data/datasources/marketplace_remote_datasource.dart';

class MarketplaceRepositoryImpl implements MarketplaceRepository {

  MarketplaceRepositoryImpl(this.remoteDataSource);
  final MarketplaceRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, MarketplaceResourcesResponse>> getMarketplaceResources({
    required String category,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final ApiResponse<List<MarketplaceResource>> response = await remoteDataSource.getMarketplaceResources(
        category,
        page,
        limit,
      );
      if (response.success && response.data != null) {
        // API returns list directly, wrap in response object
        final MarketplaceResourcesResponse resourcesResponse = MarketplaceResourcesResponse(
          resources: response.data!,
          pagination: ResourcePagination(
            page: page,
            limit: limit,
            total: response.data!.length,
            pages: 1,
          ),
        );
        return Right(resourcesResponse);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get resources'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VendorProfile>> getVendorProfile({
    required String vendorId,
  }) async {
    try {
      final ApiResponse<VendorProfile> response = await remoteDataSource.getVendorProfile(vendorId);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get vendor profile'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Booking>> createBooking({
    required CreateBookingRequest request,
  }) async {
    try {
      print('📡 REPO createBooking: calling API with ${request.toJson()}');
      final ApiResponse<Booking> response = await remoteDataSource.createBooking(request);
      print('📡 REPO createBooking: got response success=${response.success} data=${response.data} message=${response.message}');
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        // Extract message from errors map if top-level message is empty
        String errorMessage = response.message;
        if (errorMessage.isEmpty && response.errors != null) {
          errorMessage = response.errors!['message'] as String? ??
              response.errors!['code'] as String? ??
              'Failed to create booking';
        }
        if (errorMessage.isEmpty) errorMessage = 'Failed to create booking';
        return Left(ServerFailure(message: errorMessage));
      }
    } on DioException catch (e) {
      print('📡 REPO createBooking: DioException ${e.type} ${e.response?.statusCode} ${e.response?.data}');
      // Try to extract message from response body
      final responseData = e.response?.data;
      if (responseData is Map) {
        final error = responseData['error'];
        if (error is Map) {
          return Left(ServerFailure(message: error['message'] as String? ?? 'Failed to create booking'));
        }
        final msg = responseData['message'];
        if (msg is String && msg.isNotEmpty) {
          return Left(ServerFailure(message: msg));
        }
      }
      return Left(_handleDioError(e));
    } catch (e) {
      print('📡 REPO createBooking: Exception $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingsResponse>> getMyBookings({
    String? status,
  }) async {
    try {
      final ApiResponse<List<Booking>> response = await remoteDataSource.getMyBookings(status);
      if (response.success && response.data != null) {
        return Right(BookingsResponse(bookings: response.data!));
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get bookings'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookingsResponse>> getBookingRequests({
    String? status,
  }) async {
    try {
      final ApiResponse<List<Booking>> response = await remoteDataSource.getBookingRequests(status);
      if (response.success && response.data != null) {
        return Right(BookingsResponse(bookings: response.data!));
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get booking requests'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Booking>> acceptBooking({
    required String bookingId,
    double? agreedPrice,
  }) async {
    try {
      final AcceptBookingRequest request = AcceptBookingRequest(agreedPrice: agreedPrice);
      final ApiResponse<Booking> response = await remoteDataSource.acceptBooking(bookingId, request);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to accept booking'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Booking>> declineBooking({
    required String bookingId,
    String? reason,
  }) async {
    try {
      final DeclineBookingRequest request = DeclineBookingRequest(reason: reason);
      final ApiResponse<Booking> response = await remoteDataSource.declineBooking(bookingId, request);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to decline booking'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CounterOfferResponse>> sendCounterOffer({
    required String bookingId,
    required CounterOfferRequest request,
  }) async {
    try {
      final ApiResponse<CounterOfferResponse> response = await remoteDataSource.sendCounterOffer(bookingId, request);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to send counter offer'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Booking>> updateBooking({
    required String bookingId,
    required UpdateBookingRequest request,
  }) async {
    try {
      final ApiResponse<Booking> response = await remoteDataSource.updateBooking(bookingId, request);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to update booking'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VendorProfile>> getMyVendorProfile() async {
    try {
      final ApiResponse<VendorProfile> response = await remoteDataSource.getMyVendorProfile();
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get vendor profile'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VendorStats>> getVendorStats() async {
    try {
      final ApiResponse<VendorStats> response = await remoteDataSource.getVendorStats();
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get vendor stats'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MarketplaceResource>> addResource({
    required Map<String, dynamic> resourceData,
  }) async {
    try {
      final ApiResponse<MarketplaceResource> response = await remoteDataSource.addResource(resourceData);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to add resource'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MarketplaceResource>>> getMyResources() async {
    try {
      final ApiResponse<List<MarketplaceResource>> response = await remoteDataSource.getMyResources();
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get resources'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MarketplaceResource>> updateResource({
    required String resourceId,
    required Map<String, dynamic> resourceData,
  }) async {
    try {
      final ApiResponse<MarketplaceResource> response = await remoteDataSource.updateResource(resourceId, resourceData);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to update resource'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteResource({
    required String resourceId,
  }) async {
    try {
      await remoteDataSource.deleteResource(resourceId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VendorDashboard>> getVendorDashboard() async {
    try {
      final ApiResponse<VendorDashboard> response = await remoteDataSource.getVendorDashboard();
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get vendor dashboard'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(message: 'Connection timeout');
      case DioExceptionType.badResponse:
        final int? statusCode = error.response?.statusCode;
        final String message = (error.response?.data?['message'] as String?) ?? 
            (error.response?.data?['error']?['message'] as String?) ?? 'Server error';
        if (statusCode == 401) {
          return const AuthFailure(message: 'Unauthorized');
        } else if (statusCode == 403) {
          return const AuthFailure(message: 'Forbidden');
        } else if (statusCode == 404) {
          return const ServerFailure(message: 'Not found');
        }
        return ServerFailure(message: message);
      case DioExceptionType.cancel:
        return const ServerFailure(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        return const NetworkFailure(message: 'No internet connection');
      default:
        return ServerFailure(message: error.message ?? 'Unknown error');
    }
  }
}
