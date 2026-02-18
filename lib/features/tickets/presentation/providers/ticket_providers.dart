import 'package:dio/src/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/core/network/network_info.dart';
import 'package:fajimobileapp/features/tickets/data/datasources/ticket_remote_datasource.dart';
import 'package:fajimobileapp/features/tickets/data/repositories/ticket_repository_impl.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/check_in_attendee_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/check_in_guest_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/create_ticket_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/get_all_tickets_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/get_event_participants_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/get_my_tickets_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/get_purchased_tickets_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/get_ticket_by_id_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/purchase_tickets_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/validate_promo_code_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/validate_ticket_usecase.dart';

// ============================================================================
// Data Sources
// ============================================================================

/// Ticket Remote Data Source Provider
final Provider<TicketRemoteDataSource> ticketRemoteDataSourceProvider = Provider<TicketRemoteDataSource>((ProviderRef<TicketRemoteDataSource> ref) {
  final Dio dio = ref.watch(dioProvider);
  return TicketRemoteDataSource(dio);
});

// ============================================================================
// Repository
// ============================================================================

/// Ticket Repository Provider
final Provider<TicketRepository> ticketRepositoryProvider = Provider<TicketRepository>((ProviderRef<TicketRepository> ref) {
  final TicketRemoteDataSource remoteDataSource = ref.watch(ticketRemoteDataSourceProvider);
  final NetworkInfo networkInfo = ref.watch(networkInfoProvider);

  return TicketRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});

// ============================================================================
// Use Cases - NEW API
// ============================================================================

/// Purchase Tickets Use Case Provider
final Provider<PurchaseTicketsUseCase> purchaseTicketsUseCaseProvider = Provider<PurchaseTicketsUseCase>((ProviderRef<PurchaseTicketsUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return PurchaseTicketsUseCase(repository);
});

/// Validate Promo Code Use Case Provider
final Provider<ValidatePromoCodeUseCase> validatePromoCodeUseCaseProvider = Provider<ValidatePromoCodeUseCase>((ProviderRef<ValidatePromoCodeUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return ValidatePromoCodeUseCase(repository);
});

/// Get My Tickets Use Case Provider
final Provider<GetMyTicketsUseCase> getMyTicketsUseCaseProvider = Provider<GetMyTicketsUseCase>((ProviderRef<GetMyTicketsUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return GetMyTicketsUseCase(repository);
});

/// Check-In Guest Use Case Provider
final Provider<CheckInGuestUseCase> checkInGuestUseCaseProvider = Provider<CheckInGuestUseCase>((ProviderRef<CheckInGuestUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return CheckInGuestUseCase(repository);
});

// ============================================================================
// Use Cases - OLD API (Keep for backward compatibility)
// ============================================================================

/// Get All Tickets Use Case Provider
final Provider<GetAllTicketsUseCase> getAllTicketsUseCaseProvider = Provider<GetAllTicketsUseCase>((ProviderRef<GetAllTicketsUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return GetAllTicketsUseCase(repository);
});

/// Get Ticket By ID Use Case Provider
final Provider<GetTicketByIdUseCase> getTicketByIdUseCaseProvider = Provider<GetTicketByIdUseCase>((ProviderRef<GetTicketByIdUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return GetTicketByIdUseCase(repository);
});

/// Get Purchased Tickets Use Case Provider
final Provider<GetPurchasedTicketsUseCase> getPurchasedTicketsUseCaseProvider =
    Provider<GetPurchasedTicketsUseCase>((ProviderRef<GetPurchasedTicketsUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return GetPurchasedTicketsUseCase(repository);
});

/// Get Event Participants Use Case Provider
final Provider<GetEventParticipantsUseCase> getEventParticipantsUseCaseProvider =
    Provider<GetEventParticipantsUseCase>((ProviderRef<GetEventParticipantsUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return GetEventParticipantsUseCase(repository);
});

/// Create Ticket Use Case Provider
final Provider<CreateTicketUseCase> createTicketUseCaseProvider = Provider<CreateTicketUseCase>((ProviderRef<CreateTicketUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return CreateTicketUseCase(repository);
});

/// Validate Ticket Use Case Provider
final Provider<ValidateTicketUseCase> validateTicketUseCaseProvider = Provider<ValidateTicketUseCase>((ProviderRef<ValidateTicketUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return ValidateTicketUseCase(repository);
});

/// Check In Attendee Use Case Provider
final Provider<CheckInAttendeeUseCase> checkInAttendeeUseCaseProvider = Provider<CheckInAttendeeUseCase>((ProviderRef<CheckInAttendeeUseCase> ref) {
  final TicketRepository repository = ref.watch(ticketRepositoryProvider);
  return CheckInAttendeeUseCase(repository);
});
