import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/resource_category.dart';

part 'cohost_resource_entity.freezed.dart';

/// Entity representing a resource offered by a co-host
@freezed
class CohostResourceEntity with _$CohostResourceEntity {
  const factory CohostResourceEntity({
    required String id,
    required String cohostId,
    required String cohostName,
    required ResourceCategory category,
    required String title,
    required String description,
    required List<String> photos,
    required double basePrice,
    required bool isAvailable,
    required double rating,
    required int reviewCount,
    String? profilePhoto,
    int? eventsCompleted,
    bool? isVerified,
  }) = _CohostResourceEntity;
}
