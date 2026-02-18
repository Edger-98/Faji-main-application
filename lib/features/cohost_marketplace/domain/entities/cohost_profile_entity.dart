import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/resource_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cohost_profile_entity.freezed.dart';

/// Entity representing a co-host's profile
@freezed
class CohostProfileEntity with _$CohostProfileEntity {
  const factory CohostProfileEntity({
    required String id,
    required String name,
    required String bio,
    required String profilePhoto,
    required List<ResourceCategory> categories,
    required double rating,
    required int eventsCompleted,
    required bool isVerified,
    List<String>? portfolio,
    String? location,
    String? responseTime,
  }) = _CohostProfileEntity;
}
