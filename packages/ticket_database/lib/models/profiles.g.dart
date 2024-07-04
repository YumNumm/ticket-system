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
          name: $checkedConvert('name', (v) => v as String?),
          avatarId: $checkedConvert('avatar_id', (v) => v as String?),
          comment: $checkedConvert('comment', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'avatarId': 'avatar_id'},
    );

Map<String, dynamic> _$$ProfilesImplToJson(_$ProfilesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar_id': instance.avatarId,
      'comment': instance.comment,
    };
