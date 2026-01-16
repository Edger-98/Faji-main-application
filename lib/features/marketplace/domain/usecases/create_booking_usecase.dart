import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/booking.dart';
import '../repositories/marketplace_repository.dart';

class CreateBookingUseCase {
  final MarketplaceRepository repository;

  CreateBookingUseCase(this.repository);

  Future<Either<Failure, Booking>> call({
    required CreateBookingRequest request,
  }) async {
    return await repository.createBooking(
      request: request,
    );
  }
}
