import 'package:dio/src/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/core/network/api_result.dart';
import 'package:fajimobileapp/features/cohost_marketplace/data/datasources/marketplace_api_service.dart';
import 'package:fajimobileapp/features/cohost_marketplace/data/repositories/marketplace_repository.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/cohost_resource_entity.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/resource_category.dart';

/// Provider for MarketplaceApiService
final Provider<MarketplaceApiService> marketplaceApiServiceProvider = Provider<MarketplaceApiService>((ProviderRef<MarketplaceApiService> ref) {
  final Dio dio = ref.watch(dioProvider);
  return MarketplaceApiService(dio);
});

/// Provider for MarketplaceRepository
final Provider<MarketplaceRepository> marketplaceRepositoryProvider = Provider<MarketplaceRepository>((ProviderRef<MarketplaceRepository> ref) {
  final MarketplaceApiService apiService = ref.watch(marketplaceApiServiceProvider);
  return MarketplaceRepository(apiService);
});

/// Parameters for fetching vendors
class VendorFetchParams {
  
  const VendorFetchParams({
    this.eventId,
    required this.category,
  });
  final String? eventId;
  final ResourceCategory category;
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VendorFetchParams &&
          runtimeType == other.runtimeType &&
          eventId == other.eventId &&
          category == other.category;

  @override
  int get hashCode => eventId.hashCode ^ category.hashCode;
}

/// Provider for fetching vendors (event-specific or general)
final FutureProviderFamily<List<CohostResourceEntity>, VendorFetchParams> vendorsProvider = FutureProvider.family<List<CohostResourceEntity>, VendorFetchParams>(
  (FutureProviderRef<List<CohostResourceEntity>> ref, VendorFetchParams params) async {
    final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
    
    // Use event-specific endpoint if eventId is provided
    if (params.eventId != null && params.eventId!.isNotEmpty) {
      print('🔄 Provider: Fetching vendors for event ${params.eventId}, category: ${params.category.name}');
      final ApiResult<List<CohostResourceEntity>> result = await repository.getVendorsForEvent(
        eventId: params.eventId!,
        category: params.category,
      );
      
      return result.when(
        success: (List<CohostResourceEntity> vendors) {
          print('✅ Provider: Successfully fetched ${vendors.length} vendors');
          return vendors;
        },
        failure: (String error) {
          print('❌ Provider: Failed to fetch vendors: $error');
          throw Exception(error);
        },
      );
    }
    
    // Otherwise use general marketplace endpoint
    print('🔄 Provider: Fetching resources for ${params.category.name}');
    final ApiResult<List<CohostResourceEntity>> result = await repository.getResourcesByCategory(category: params.category);
    
    return result.when(
      success: (List<CohostResourceEntity> resources) {
        print('✅ Provider: Successfully fetched ${resources.length} resources');
        return resources;
      },
      failure: (String error) {
        print('❌ Provider: Failed to fetch resources: $error');
        throw Exception(error);
      },
    );
  },
);

/// Legacy provider for backward compatibility
@Deprecated('Use vendorsProvider instead')
final FutureProviderFamily<List<CohostResourceEntity>, ResourceCategory> resourcesByCategoryProvider = FutureProvider.family<List<CohostResourceEntity>, ResourceCategory>(
  (FutureProviderRef<List<CohostResourceEntity>> ref, ResourceCategory category) async => ref.watch(vendorsProvider(VendorFetchParams(category: category)).future),
);
