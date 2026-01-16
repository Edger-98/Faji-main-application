import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/refund_response.dart';
import '../entities/revenue_distribution.dart';
import '../entities/verification_status.dart';
import '../entities/verify_event_response.dart';

/// Event Verification Repository Interface
abstract class EventVerificationRepository {
  /// Get verification status
  Future<Either<Failure, VerificationStatus>> getVerificationStatus(
    String eventId,
  );

  /// Verify event
  Future<Either<Failure, VerifyEventResponse>> verifyEvent({
    required String eventId,
    bool manualOverride = false,
  });

  /// Get revenue distribution
  Future<Either<Failure, RevenueDistribution>> getRevenueDistribution(
    String eventId,
  );

  /// Process refunds
  Future<Either<Failure, RefundResponse>> processRefunds({
    required String eventId,
    String? reason,
  });

  /// Release escrow manually
  Future<Either<Failure, VerifyEventResponse>> releaseEscrow(
    String eventId,
  );
}
