// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_invitation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AcceptInvitationResponseImpl _$$AcceptInvitationResponseImplFromJson(
  Map json,
) => $checkedCreate(r'_$AcceptInvitationResponseImpl', json, ($checkedConvert) {
  final val = _$AcceptInvitationResponseImpl(
    invitationId: $checkedConvert('invitationId', (v) => v as String),
    eventId: $checkedConvert('eventId', (v) => v as String),
    status: $checkedConvert('status', (v) => v as String),
    cohost: $checkedConvert(
      'cohost',
      (v) => AcceptedCohost.fromJson(Map<String, dynamic>.from(v as Map)),
    ),
    acceptedAt: $checkedConvert('acceptedAt', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$$AcceptInvitationResponseImplToJson(
  _$AcceptInvitationResponseImpl instance,
) => <String, dynamic>{
  'invitationId': instance.invitationId,
  'eventId': instance.eventId,
  'status': instance.status,
  'cohost': instance.cohost.toJson(),
  'acceptedAt': instance.acceptedAt,
};

_$AcceptedCohostImpl _$$AcceptedCohostImplFromJson(Map json) =>
    $checkedCreate(r'_$AcceptedCohostImpl', json, ($checkedConvert) {
      final val = _$AcceptedCohostImpl(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        revenueShare: $checkedConvert(
          'revenueShare',
          (v) => (v as num).toDouble(),
        ),
        role: $checkedConvert('role', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$AcceptedCohostImplToJson(
  _$AcceptedCohostImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'revenueShare': instance.revenueShare,
  'role': instance.role,
};

_$DeclineInvitationRequestImpl _$$DeclineInvitationRequestImplFromJson(
  Map json,
) => $checkedCreate(r'_$DeclineInvitationRequestImpl', json, ($checkedConvert) {
  final val = _$DeclineInvitationRequestImpl(
    reason: $checkedConvert('reason', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$$DeclineInvitationRequestImplToJson(
  _$DeclineInvitationRequestImpl instance,
) => <String, dynamic>{if (instance.reason case final value?) 'reason': value};

_$DeclineInvitationResponseImpl _$$DeclineInvitationResponseImplFromJson(
  Map json,
) =>
    $checkedCreate(r'_$DeclineInvitationResponseImpl', json, ($checkedConvert) {
      final val = _$DeclineInvitationResponseImpl(
        invitationId: $checkedConvert('invitationId', (v) => v as String),
        status: $checkedConvert('status', (v) => v as String),
        declinedAt: $checkedConvert('declinedAt', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$DeclineInvitationResponseImplToJson(
  _$DeclineInvitationResponseImpl instance,
) => <String, dynamic>{
  'invitationId': instance.invitationId,
  'status': instance.status,
  'declinedAt': instance.declinedAt,
};
