import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fajimobileapp/features/events/domain/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
    required String icon,
    String? description,
    @Default(true) bool isActive,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
        icon: icon,
        description: description,
        isActive: isActive,
      );
}