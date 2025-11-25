import 'package:freezed_annotation/freezed_annotation.dart';

part 'poster_template_entity.freezed.dart';

/// Entity representing a poster template
@freezed
class PosterTemplateEntity with _$PosterTemplateEntity {
  const factory PosterTemplateEntity({
    required String id,
    required String name,
    required String previewUrl,
    String? description,
  }) = _PosterTemplateEntity;
}
