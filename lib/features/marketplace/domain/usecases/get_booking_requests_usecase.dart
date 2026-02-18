import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/booking.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class GetBookingRequestsUseCase {

  GetBookingRequestsUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, BookingsResponse>> call({
    String? status,
  }) async => await repository.getBookingRequests(
      status: status,
    );
}
