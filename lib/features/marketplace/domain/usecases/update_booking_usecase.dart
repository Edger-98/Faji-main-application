import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/booking.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class UpdateBookingUseCase {

  UpdateBookingUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, Booking>> call({
    required String bookingId,
    required UpdateBookingRequest request,
  }) async => await repository.updateBooking(
      bookingId: bookingId,
      request: request,
    );
}
