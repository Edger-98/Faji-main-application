import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/check_in_request.dart';
import '../../domain/entities/my_ticket.dart';
import '../../domain/entities/promo_code_validation.dart';
import '../../domain/entities/purchase_ticket_request.dart';
import '../../domain/entities/purchase_ticket_response.dart';
import '../../domain/entities/ticket_entity.dart';
import '../../domain/repositories/ticket_repository.dart';
import '../datasources/ticket_remote_datasource.dart';

/// Ticket repository implementation
class TicketRepositoryImpl implements TicketRepository {
  final TicketRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TicketRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  // ========== NEW API METHODS ==========

  @override
  Future<Either<Failure, PurchaseTicketResponse>> purchaseTickets(
    PurchaseTicketRequest request,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      print('🎫 Calling purchaseTickets API...');
      print('   Request: ${request.toJson()}');
      
      final response = await remoteDataSource.purchaseTickets(request);

      print('✅ Purchase response received');
      print('   Success: ${response.success}');
      print('   Message: ${response.message}');
      print('   Data: ${response.data}');

      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      print('❌ DioException during purchase:');
      print('   Status: ${e.response?.statusCode}');
      print('   Response data: ${e.response?.data}');
      return Left(_handleDioError(e));
    } catch (e, stackTrace) {
      print('❌ Unexpected error during purchase: $e');
      print('   Stack trace: $stackTrace');
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PromoCodeValidation>> validatePromoCode({
    required String eventId,
    required String promoCode,
    double? amount,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.validatePromoCode({
        'eventId': eventId,
        'promoCode': promoCode,
        if (amount != null) 'amount': amount,
      });

      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MyTicketsResponse>> getMyTickets({
    String? status,
    int page = 1,
    int limit = 20,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getMyTickets(status, page, limit);

      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CheckInResponse>> checkInGuest(
    CheckInRequest request,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.checkInGuest(request);

      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ========== OLD METHODS (Keep for backward compatibility) ==========


  @override
  Future<Either<Failure, List<TicketEntity>>> getAllTickets() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getAllTickets();

      if (response.success && response.data != null) {
        final tickets = response.data!.map((model) => model.toEntity()).toList();
        return Right(tickets);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TicketEntity>> getTicketById(String id) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getTicketById(id);

      if (response.success && response.data != null) {
        return Right(response.data!.toEntity());
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TicketEntity>>> getPurchasedTickets(
      String userId) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getPurchasedTickets(userId);

      if (response.success && response.data != null) {
        final tickets = response.data!.map((model) => model.toEntity()).toList();
        return Right(tickets);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TicketEntity>>> getEventParticipants(
      String eventId) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getEventParticipants(eventId);

      if (response.success && response.data != null) {
        final tickets = response.data!.map((model) => model.toEntity()).toList();
        return Right(tickets);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getTotalTicketsSold(String eventId) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getTotalTicketsSold(eventId);

      if (response.response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>?;
        final total = data?['total'] as int? ?? 0;
        return Right(total);
      } else {
        return Left(ServerFailure(message: 'Failed to get total tickets'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getUsersByEventId(String eventId) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getUsersByEventId(eventId);

      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TicketEntity>>> filterTickets({
    required String filter,
    required String value,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.filterTickets(filter, value);

      if (response.success && response.data != null) {
        final tickets = response.data!.map((model) => model.toEntity()).toList();
        return Right(tickets);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TicketEntity>> createTicket({
    required String userId,
    required String eventId,
    required int ticketId,
    required DateTime purchasedDate,
    String? promoCode,
    required int quantity,
    required String transactionId,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.createTicket({
        'userId': userId,
        'eventId': eventId,
        'ticketId': ticketId,
        'purchasedDate': purchasedDate.toIso8601String(),
        if (promoCode != null) 'promoCode': promoCode,
        'quantity': quantity,
        'transactionId': transactionId,
      });

      if (response.success && response.data != null) {
        return Right(response.data!.toEntity());
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> validateTicket({
    required int ticketId,
    required String eventId,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.validateTicket({
        'ticketId': ticketId,
        'eventId': eventId,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(ServerFailure(message: 'Invalid ticket'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkInAttendee({
    required int ticketId,
    required String eventId,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.checkInAttendee({
        'ticketId': ticketId,
        'eventId': eventId,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(ServerFailure(message: 'Check-in failed'));
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
        return NetworkFailure.timeout();
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        
        // Safely extract error message from response
        String message = 'An error occurred';
        final responseData = error.response?.data;
        
        if (responseData is Map<String, dynamic>) {
          // Try to extract message from various possible fields
          final msgField = responseData['message'];
          final errorField = responseData['error'];
          
          if (msgField is String) {
            message = msgField;
          } else if (msgField is Map && msgField['message'] is String) {
            message = msgField['message'];
          } else if (errorField is String) {
            message = errorField;
          } else if (errorField is Map && errorField['message'] is String) {
            message = errorField['message'];
          }
        } else if (responseData is String) {
          message = responseData;
        }

        if (statusCode == 401) {
          // Check if this is an authorization issue for event access
          final customMessage = message.toLowerCase().contains('event') || 
                               message.toLowerCase().contains('access') ||
                               message.toLowerCase().contains('permission')
              ? "You're not authorized to perform this action on this event"
              : message;
          return AuthFailure(message: customMessage);
        } else if (statusCode == 422 || statusCode == 400) {
          return ValidationFailure(message: message);
        } else if (statusCode == 404) {
          return ServerFailure(message: 'Ticket not found');
        }
        return ServerFailure(message: message);
      case DioExceptionType.cancel:
        return const NetworkFailure(message: 'Request cancelled');
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return NetworkFailure.connectionError();
    }
  }
}
