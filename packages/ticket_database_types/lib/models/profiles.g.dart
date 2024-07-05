// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'profiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfilesImpl _$$ProfilesImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ProfilesImpl',
      json,
      ($checkedConvert) {
        final val = _$ProfilesImpl(
          id: $checkedConvert('id', (v) => v as String),
          role: $checkedConvert('role', (v) => $enumDecode(_$RoleEnumMap, v)),
          name: $checkedConvert('name', (v) => v as String?),
          avatarName: $checkedConvert('avatar_name', (v) => v as String?),
          comment: $checkedConvert('comment', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'avatarName': 'avatar_name'},
    );

Map<String, dynamic> _$$ProfilesImplToJson(_$ProfilesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$RoleEnumMap[instance.role]!,
      'name': instance.name,
      'avatar_name': instance.avatarName,
      'comment': instance.comment,
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.user: 'user',
  Role.sponsor: 'sponsor',
  Role.speaker: 'speaker',
};
