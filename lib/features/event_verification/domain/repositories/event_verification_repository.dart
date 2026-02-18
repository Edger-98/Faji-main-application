import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/refund_response.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/revenue_distribution.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/verification_status.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/verify_event_response.dart';

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
