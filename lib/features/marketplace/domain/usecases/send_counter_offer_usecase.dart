import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/counter_offer.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class SendCounterOfferUseCase {

  SendCounterOfferUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, CounterOfferResponse>> call({
    required String bookingId,
    required CounterOfferRequest request,
  }) async => await repository.sendCounterOffer(
      bookingId: bookingId,
      request: request,
    );
}
