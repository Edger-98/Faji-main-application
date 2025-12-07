import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/models/budget_model.dart';
import '../../../../core/models/vendor_model.dart';
import '../../../../core/models/planner_model.dart';

class PlanTabRepository {
  final ApiService _api;
  
  PlanTabRepository(this._api);
  
  /// Get event budget
  Future<BudgetDetailModel> getBudget(String eventId) async {
    try {
      final response = await _api.get('/events/$eventId/budget');
      return BudgetDetailModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to load budget: $e');
    }
  }
  
  /// Get event vendors
  Future<List<VendorModel>> getVendors(String eventId) async {
    try {
      final response = await _api.get('/events/$eventId/vendors');
      final data = response.data['data'];
      final vendors = (data['vendors'] as List)
          .map((e) => VendorModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return vendors;
    } catch (e) {
      throw Exception('Failed to load vendors: $e');
    }
  }
  
  /// Get event planners
  Future<List<PlannerModel>> getPlanners(String eventId) async {
    try {
      final response = await _api.get('/events/$eventId/planners');
      final data = response.data['data'];
      final planners = (data['planners'] as List)
          .map((e) => PlannerModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return planners;
    } catch (e) {
      throw Exception('Failed to load planners: $e');
    }
  }
}

final planTabRepositoryProvider = Provider<PlanTabRepository>((ref) {
  return PlanTabRepository(ref.read(apiServiceProvider));
});
