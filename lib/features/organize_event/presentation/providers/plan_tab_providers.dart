import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/budget_model.dart';
import '../../../../core/models/vendor_model.dart';
import '../../../../core/models/planner_model.dart';
import '../../../../core/models/task_model.dart';
import '../../data/repositories/plan_tab_repository.dart';
import '../../data/repositories/task_repository.dart';

// Budget provider
final budgetProvider = FutureProvider.autoDispose.family<BudgetDetailModel, String>(
  (ref, eventId) async {
    final repository = ref.read(planTabRepositoryProvider);
    return repository.getBudget(eventId);
  },
);

// Vendors provider
final vendorsProvider = FutureProvider.autoDispose.family<List<VendorModel>, String>(
  (ref, eventId) async {
    final repository = ref.read(planTabRepositoryProvider);
    return repository.getVendors(eventId);
  },
);

// Planners provider
final plannersProvider = FutureProvider.autoDispose.family<List<PlannerModel>, String>(
  (ref, eventId) async {
    final repository = ref.read(planTabRepositoryProvider);
    return repository.getPlanners(eventId);
  },
);

// Tasks provider (already exists, just re-export)
final planTabTasksProvider = FutureProvider.autoDispose.family<TaskListResponse, String>(
  (ref, eventId) async {
    final repository = ref.read(taskRepositoryProvider);
    return repository.getTasks(eventId);
  },
);
