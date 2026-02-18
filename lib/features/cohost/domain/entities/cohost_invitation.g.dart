// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cohost_invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CohostInvitationImpl _$$CohostInvitationImplFromJson(Map json) =>
    $checkedCreate(r'_$CohostInvitationImpl', json, ($checkedConvert) {
      final val = _$CohostInvitationImpl(
        id: $checkedConvert('id', (v) => v as String),
        event: $checkedConvert(
          'event',
          (v) => CohostEvent.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        host: $checkedConvert(
          'host',
          (v) => CohostUser.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        revenueShare: $checkedConvert(
          'revenueShare',
          (v) => (v as num).toDouble(),
        ),
        status: $checkedConvert('status', (v) => v as String),
        createdAt: $checkedConvert('createdAt', (v) => v as String),
        expiresAt: $checkedConvert('expiresAt', (v) => v as String),
        message: $checkedConvert('message', (v) => v as String?),
        respondedAt: $checkedConvert('respondedAt', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$CohostInvitationImplToJson(
  _$CohostInvitationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'event': instance.event.toJson(),
  'host': instance.host.toJson(),
  'revenueShare': instance.revenueShare,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'expiresAt': instance.expiresAt,
  if (instance.message case final value?) 'message': value,
  if (instance.respondedAt case final value?) 'respondedAt': value,
};

_$CohostEventImpl _$$CohostEventImplFromJson(Map json) =>
    $checkedCreate(r'_$CohostEventImpl', json, ($checkedConvert) {
      final val = _$CohostEventImpl(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        startDate: $checkedConvert('startDate', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$CohostEventImplToJson(_$CohostEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startDate': instance.startDate,
      if (instance.imageUrl case final value?) 'imageUrl': value,
    };

_$CohostUserImpl _$$CohostUserImplFromJson(Map json) =>
    $checkedCreate(r'_$CohostUserImpl', json, ($checkedConvert) {
      final val = _$CohostUserImpl(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        avatar: $checkedConvert('avatar', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$CohostUserImplToJson(_$CohostUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      if (instance.avatar case final value?) 'avatar': value,
    };

_$CohostInvitationsResponseImpl _$$CohostInvitationsResponseImplFromJson(
  Map json,
) => $checkedCreate(r'_$CohostInvitationsResponseImpl', json, (
  $checkedConvert,
) {
  final val = _$CohostInvitationsResponseImpl(
    invitations: $checkedConvert(
      'invitations',
      (v) => (v as List<dynamic>)
          .map(
            (e) =>
                CohostInvitation.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList(),
    ),
    pagination: $checkedConvert(
      'pagination',
      (v) => PaginationData.fromJson(Map<String, dynamic>.from(v as Map)),
    ),
  );
  return val;
});

Map<String, dynamic> _$$CohostInvitationsResponseImplToJson(
  _$CohostInvitationsResponseImpl instance,
) => <String, dynamic>{
  'invitations': instance.invitations.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};

_$PaginationDataImpl _$$PaginationDataImplFromJson(Map json) =>
    $checkedCreate(r'_$PaginationDataImpl', json, ($checkedConvert) {
      final val = _$PaginationDataImpl(
        page: $checkedConvert('page', (v) => (v as num).toInt()),
        limit: $checkedConvert('limit', (v) => (v as num).toInt()),
        total: $checkedConvert('total', (v) => (v as num).toInt()),
        pages: $checkedConvert('pages', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$$PaginationDataImplToJson(
  _$PaginationDataImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'total': instance.total,
  'pages': instance.pages,
};
