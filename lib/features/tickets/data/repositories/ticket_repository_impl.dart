import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
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
        final message = error.response?.data?['message'] as String? ??
            error.response?.data?['error'] as String? ??
            'An error occurred';

        if (statusCode == 401) {
          return AuthFailure(message: message);
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
