import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/network_info.dart';
import '../../data/datasources/ticket_remote_datasource.dart';
import '../../data/repositories/ticket_repository_impl.dart';
import '../../domain/repositories/ticket_repository.dart';
import '../../domain/usecases/check_in_attendee_usecase.dart';
import '../../domain/usecases/check_in_guest_usecase.dart';
import '../../domain/usecases/create_ticket_usecase.dart';
import '../../domain/usecases/get_all_tickets_usecase.dart';
import '../../domain/usecases/get_event_participants_usecase.dart';
import '../../domain/usecases/get_my_tickets_usecase.dart';
import '../../domain/usecases/get_purchased_tickets_usecase.dart';
import '../../domain/usecases/get_ticket_by_id_usecase.dart';
import '../../domain/usecases/purchase_tickets_usecase.dart';
import '../../domain/usecases/validate_promo_code_usecase.dart';
import '../../domain/usecases/validate_ticket_usecase.dart';

// ============================================================================
// Data Sources
// ============================================================================

/// Ticket Remote Data Source Provider
final ticketRemoteDataSourceProvider = Provider<TicketRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return TicketRemoteDataSource(dio);
});

// ============================================================================
// Repository
// ============================================================================

/// Ticket Repository Provider
final ticketRepositoryProvider = Provider<TicketRepository>((ref) {
  final remoteDataSource = ref.watch(ticketRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);

  return TicketRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});

// ============================================================================
// Use Cases - NEW API
// ============================================================================

/// Purchase Tickets Use Case Provider
final purchaseTicketsUseCaseProvider = Provider<PurchaseTicketsUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return PurchaseTicketsUseCase(repository);
});

/// Validate Promo Code Use Case Provider
final validatePromoCodeUseCaseProvider = Provider<ValidatePromoCodeUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return ValidatePromoCodeUseCase(repository);
});

/// Get My Tickets Use Case Provider
final getMyTicketsUseCaseProvider = Provider<GetMyTicketsUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return GetMyTicketsUseCase(repository);
});

/// Check-In Guest Use Case Provider
final checkInGuestUseCaseProvider = Provider<CheckInGuestUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return CheckInGuestUseCase(repository);
});

// ============================================================================
// Use Cases - OLD API (Keep for backward compatibility)
// ============================================================================

/// Get All Tickets Use Case Provider
final getAllTicketsUseCaseProvider = Provider<GetAllTicketsUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return GetAllTicketsUseCase(repository);
});

/// Get Ticket By ID Use Case Provider
final getTicketByIdUseCaseProvider = Provider<GetTicketByIdUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return GetTicketByIdUseCase(repository);
});

/// Get Purchased Tickets Use Case Provider
final getPurchasedTicketsUseCaseProvider =
    Provider<GetPurchasedTicketsUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return GetPurchasedTicketsUseCase(repository);
});

/// Get Event Participants Use Case Provider
final getEventParticipantsUseCaseProvider =
    Provider<GetEventParticipantsUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return GetEventParticipantsUseCase(repository);
});

/// Create Ticket Use Case Provider
final createTicketUseCaseProvider = Provider<CreateTicketUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return CreateTicketUseCase(repository);
});

/// Validate Ticket Use Case Provider
final validateTicketUseCaseProvider = Provider<ValidateTicketUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return ValidateTicketUseCase(repository);
});

/// Check In Attendee Use Case Provider
final checkInAttendeeUseCaseProvider = Provider<CheckInAttendeeUseCase>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return CheckInAttendeeUseCase(repository);
});
