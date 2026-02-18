import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/booking.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class DeclineBookingUseCase {

  DeclineBookingUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, Booking>> call({
    required String bookingId,
    String? reason,
  }) async => await repository.declineBooking(
      bookingId: bookingId,
      reason: reason,
    );
}
