import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/booking.dart';
import '../repositories/marketplace_repository.dart';

class UpdateBookingUseCase {
  final MarketplaceRepository repository;

  UpdateBookingUseCase(this.repository);

  Future<Either<Failure, Booking>> call({
    required String bookingId,
    required UpdateBookingRequest request,
  }) async {
    return await repository.updateBooking(
      bookingId: bookingId,
      request: request,
    );
  }
}
