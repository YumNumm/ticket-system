// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'purchases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchasesImpl _$$PurchasesImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$PurchasesImpl',
      json,
      ($checkedConvert) {
        final val = _$PurchasesImpl(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          userId: $checkedConvert('user_id', (v) => v as String),
          sessionId: $checkedConvert('session_id', (v) => v as String),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'sessionId': 'session_id',
        'createdAt': 'created_at'
      },
    );

Map<String, dynamic> _$$PurchasesImplToJson(_$PurchasesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'created_at': instance.createdAt.toIso8601String(),
    };
