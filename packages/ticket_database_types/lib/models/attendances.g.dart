// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'attendances.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendancesImpl _$$AttendancesImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$AttendancesImpl',
      json,
      ($checkedConvert) {
        final val = _$AttendancesImpl(
          id: $checkedConvert('id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String),
          status: $checkedConvert(
              'status', (v) => $enumDecode(_$AttendanceStatusEnumMap, v)),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'userId': 'user_id', 'createdAt': 'created_at'},
    );

Map<String, dynamic> _$$AttendancesImplToJson(_$AttendancesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'status': _$AttendanceStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$AttendanceStatusEnumMap = {
  AttendanceStatus.present: 'present',
  AttendanceStatus.leave: 'leave',
};
