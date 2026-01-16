import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/promo_code_validation.dart';
import '../repositories/ticket_repository.dart';

/// Validate Promo Code Use Case
class ValidatePromoCodeUseCase {
  final TicketRepository repository;

  ValidatePromoCodeUseCase(this.repository);

  Future<Either<Failure, PromoCodeValidation>> call({
    required String eventId,
    required String promoCode,
    double? amount,
  }) async {
    return await repository.validatePromoCode(
      eventId: eventId,
      promoCode: promoCode,
      amount: amount,
    );
  }
}
