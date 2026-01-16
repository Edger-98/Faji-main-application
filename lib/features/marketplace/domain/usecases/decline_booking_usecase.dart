import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/booking.dart';
import '../repositories/marketplace_repository.dart';

class DeclineBookingUseCase {
  final MarketplaceRepository repository;

  DeclineBookingUseCase(this.repository);

  Future<Either<Failure, Booking>> call({
    required String bookingId,
    String? reason,
  }) async {
    return await repository.declineBooking(
      bookingId: bookingId,
      reason: reason,
    );
  }
}
