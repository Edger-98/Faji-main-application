import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/models/budget_model.dart';
import 'package:fajimobileapp/core/models/vendor_model.dart';
import 'package:fajimobileapp/core/models/planner_model.dart';
import 'package:fajimobileapp/core/models/task_model.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/plan_tab_repository.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/task_repository.dart';

// Budget provider
final AutoDisposeFutureProviderFamily<BudgetDetailModel, String> budgetProvider = FutureProvider.autoDispose.family<BudgetDetailModel, String>(
  (AutoDisposeFutureProviderRef<BudgetDetailModel> ref, String eventId) async {
    final PlanTabRepository repository = ref.read(planTabRepositoryProvider);
    return repository.getBudget(eventId);
  },
);

// Vendors provider
final AutoDisposeFutureProviderFamily<List<VendorModel>, String> vendorsProvider = FutureProvider.autoDispose.family<List<VendorModel>, String>(
  (AutoDisposeFutureProviderRef<List<VendorModel>> ref, String eventId) async {
    final PlanTabRepository repository = ref.read(planTabRepositoryProvider);
    return repository.getVendors(eventId);
  },
);

// Planners provider
final AutoDisposeFutureProviderFamily<List<PlannerModel>, String> plannersProvider = FutureProvider.autoDispose.family<List<PlannerModel>, String>(
  (AutoDisposeFutureProviderRef<List<PlannerModel>> ref, String eventId) async {
    final PlanTabRepository repository = ref.read(planTabRepositoryProvider);
    return repository.getPlanners(eventId);
  },
);

// Tasks provider (already exists, just re-export)
final AutoDisposeFutureProviderFamily<TaskListResponse, String> planTabTasksProvider = FutureProvider.autoDispose.family<TaskListResponse, String>(
  (AutoDisposeFutureProviderRef<TaskListResponse> ref, String eventId) async {
    final TaskRepository repository = ref.read(taskRepositoryProvider);
    return repository.getTasks(eventId);
  },
);
