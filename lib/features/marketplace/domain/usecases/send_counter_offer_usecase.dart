import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/counter_offer.dart';
import '../repositories/marketplace_repository.dart';

class SendCounterOfferUseCase {
  final MarketplaceRepository repository;

  SendCounterOfferUseCase(this.repository);

  Future<Either<Failure, CounterOfferResponse>> call({
    required String bookingId,
    required CounterOfferRequest request,
  }) async {
    return await repository.sendCounterOffer(
      bookingId: bookingId,
      request: request,
    );
  }
}
