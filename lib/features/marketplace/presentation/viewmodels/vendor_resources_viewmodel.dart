import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/marketplace_resource.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_my_resources_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/add_resource_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/update_resource_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/delete_resource_usecase.dart';

// State for vendor resources
typedef VendorResourcesState = BaseState<List<MarketplaceResource>>;

class VendorResourcesViewModel extends StateNotifier<VendorResourcesState> {

  VendorResourcesViewModel(
    this._getMyResourcesUseCase,
    this._addResourceUseCase,
    this._updateResourceUseCase,
    this._deleteResourceUseCase,
  ) : super(const BaseState.initial());
  final GetMyResourcesUseCase _getMyResourcesUseCase;
  final AddResourceUseCase _addResourceUseCase;
  final UpdateResourceUseCase _updateResourceUseCase;
  final DeleteResourceUseCase _deleteResourceUseCase;

  /// Get my resources
  Future<void> getMyResources() async {
    state = const BaseState.loading();

    final Either<Failure, List<MarketplaceResource>> result = await _getMyResourcesUseCase();

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (List<MarketplaceResource> resources) => state = BaseState.success(resources),
    );
  }

  /// Add resource
  Future<MarketplaceResource?> addResource({
    required Map<String, dynamic> resourceData,
  }) async {
    final Either<Failure, MarketplaceResource> result = await _addResourceUseCase(
      resourceData: resourceData,
    );

    return result.fold(
      (Failure failure) => null,
      (MarketplaceResource resource) {
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
    final Either<Failure, MarketplaceResource> result = await _updateResourceUseCase(
      resourceId: resourceId,
      resourceData: resourceData,
    );

    return result.fold(
      (Failure failure) => false,
      (MarketplaceResource resource) {
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
    final Either<Failure, void> result = await _deleteResourceUseCase(
      resourceId: resourceId,
    );

    return result.fold(
      (Failure failure) => false,
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
