import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_entity.freezed.dart';

/// Entity representing an event theme
@freezed
class ThemeEntity with _$ThemeEntity {
  const factory ThemeEntity({
    required String id,
    required String name,
    required List<Color> gradientColors,
    String? description,
  }) = _ThemeEntity;
}
