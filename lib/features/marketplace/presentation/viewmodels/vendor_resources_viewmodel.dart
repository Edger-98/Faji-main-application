import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base/base_state.dart';
import '../../domain/entities/marketplace_resource.dart';
import '../../domain/usecases/get_my_resources_usecase.dart';
import '../../domain/usecases/add_resource_usecase.dart';
import '../../domain/usecases/update_resource_usecase.dart';
import '../../domain/usecases/delete_resource_usecase.dart';

// State for vendor resources
typedef VendorResourcesState = BaseState<List<MarketplaceResource>>;

class VendorResourcesViewModel extends StateNotifier<VendorResourcesState> {
  final GetMyResourcesUseCase _getMyResourcesUseCase;
  final AddResourceUseCase _addResourceUseCase;
  final UpdateResourceUseCase _updateResourceUseCase;
  final DeleteResourceUseCase _deleteResourceUseCase;

  VendorResourcesViewModel(
    this._getMyResourcesUseCase,
    this._addResourceUseCase,
    this._updateResourceUseCase,
    this._deleteResourceUseCase,
  ) : super(const BaseState.initial());

  /// Get my resources
  Future<void> getMyResources() async {
    state = const BaseState.loading();

    final result = await _getMyResourcesUseCase();

    result.fold(
      (failure) => state = BaseState.error(failure),
      (resources) => state = BaseState.success(resources),
    );
  }

  /// Add resource
  Future<MarketplaceResource?> addResource({
    required Map<String, dynamic> resourceData,
  }) async {
    final result = await _addResourceUseCase(
      resourceData: resourceData,
    );

    return result.fold(
      (failure) => null,
      (resource) {
        // Refresh list after adding
        getMyResources();
        return resource;
      },
    );
  }

  /// Update resource
  Future<bool> updateResource({
    required String resourceId,
    required Map<String, dynamic> resourceData,
  }) async {
    final result = await _updateResourceUseCase(
      resourceId: resourceId,
      resourceData: resourceData,
    );

    return result.fold(
      (failure) => false,
      (resource) {
        // Refresh list after updating
        getMyResources();
        return true;
      },
    );
  }

  /// Delete resource
  Future<bool> deleteResource({
    required String resourceId,
  }) async {
    final result = await _deleteResourceUseCase(
      resourceId: resourceId,
    );

    return result.fold(
      (failure) => false,
      (_) {
        // Refresh list after deleting
        getMyResources();
        return true;
      },
    );
  }

  /// Refresh
  Future<void> refresh() async {
    await getMyResources();
  }
}
