import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/booking.dart';
import '../repositories/marketplace_repository.dart';

class GetMyBookingsUseCase {
  final MarketplaceRepository repository;

  GetMyBookingsUseCase(this.repository);

  Future<Either<Failure, BookingsResponse>> call({
    String? status,
  }) async {
    return await repository.getMyBookings(
      status: status,
    );
  }
}
