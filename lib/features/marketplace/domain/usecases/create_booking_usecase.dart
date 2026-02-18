import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/booking.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class CreateBookingUseCase {

  CreateBookingUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, Booking>> call({
    required CreateBookingRequest request,
  }) async => await repository.createBooking(
      request: request,
    );
}
