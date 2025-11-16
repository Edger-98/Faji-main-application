import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/network_info.dart';
import '../../data/datasources/ticket_remote_datasource.dart';
import '../../data/repositories/ticket_repository_impl.dart';
import '../../domain/repositories/ticket_repository.dart';
import '../../domain/usecases/check_in_attendee_usecase.dart';
import '../../domain/usecases/create_ticket_usecase.dart';
import '../../domain/usecases/get_all_tickets_usecase.dart';
import '../../domain/usecases/get_event_participants_usecase.dart';
import '../../domain/usecases/get_purchased_tickets_usecase.dart';
import '../../domain/usecases/get_ticket_by_id_usecase.dart';
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
// Use Cases
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
