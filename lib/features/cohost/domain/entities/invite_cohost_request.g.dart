// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_cohost_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InviteCohostRequestImpl _$$InviteCohostRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$InviteCohostRequestImpl', json, ($checkedConvert) {
      final val = _$InviteCohostRequestImpl(
        userId: $checkedConvert('userId', (v) => v as String),
        revenueShare: $checkedConvert(
          'revenueShare',
          (v) => (v as num).toDouble(),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$InviteCohostRequestImplToJson(
  _$InviteCohostRequestImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'revenueShare': instance.revenueShare,
  if (instance.message case final value?) 'message': value,
};

_$InviteCohostResponseImpl _$$InviteCohostResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$InviteCohostResponseImpl', json, ($checkedConvert) {
      final val = _$InviteCohostResponseImpl(
        invitationId: $checkedConvert('invitationId', (v) => v as String),
        eventId: $checkedConvert('eventId', (v) => v as String),
        eventName: $checkedConvert('eventName', (v) => v as String),
        host: $checkedConvert(
          'host',
          (v) => InviteHost.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        invitee: $checkedConvert(
          'invitee',
          (v) => InviteInvitee.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        revenueShare: $checkedConvert(
          'revenueShare',
          (v) => (v as num).toDouble(),
        ),
        status: $checkedConvert('status', (v) => v as String),
        createdAt: $checkedConvert('createdAt', (v) => v as String),
        expiresAt: $checkedConvert('expiresAt', (v) => v as String),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$InviteCohostResponseImplToJson(
  _$InviteCohostResponseImpl instance,
) => <String, dynamic>{
  'invitationId': instance.invitationId,
  'eventId': instance.eventId,
  'eventName': instance.eventName,
  'host': instance.host.toJson(),
  'invitee': instance.invitee.toJson(),
  'revenueShare': instance.revenueShare,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'expiresAt': instance.expiresAt,
  if (instance.message case final value?) 'message': value,
};

_$InviteHostImpl _$$InviteHostImplFromJson(Map json) =>
    $checkedCreate(r'_$InviteHostImpl', json, ($checkedConvert) {
      final val = _$InviteHostImpl(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$InviteHostImplToJson(_$InviteHostImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_$InviteInviteeImpl _$$InviteInviteeImplFromJson(Map json) =>
    $checkedCreate(r'_$InviteInviteeImpl', json, ($checkedConvert) {
      final val = _$InviteInviteeImpl(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$InviteInviteeImplToJson(_$InviteInviteeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
