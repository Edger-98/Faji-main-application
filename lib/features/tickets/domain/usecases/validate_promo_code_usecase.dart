import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/promo_code_validation.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';

/// Validate Promo Code Use Case
class ValidatePromoCodeUseCase {

  ValidatePromoCodeUseCase(this.repository);
  final TicketRepository repository;

  Future<Either<Failure, PromoCodeValidation>> call({
    required String eventId,
    required String promoCode,
    double? amount,
  }) async => await repository.validatePromoCode(
      eventId: eventId,
      promoCode: promoCode,
      amount: amount,
    );
}
