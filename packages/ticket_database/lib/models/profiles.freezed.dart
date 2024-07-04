// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profiles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profiles _$ProfilesFromJson(Map<String, dynamic> json) {
  return _Profiles.fromJson(json);
}

/// @nodoc
mixin _$Profiles {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatarId => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfilesCopyWith<Profiles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilesCopyWith<$Res> {
  factory $ProfilesCopyWith(Profiles value, $Res Function(Profiles) then) =
      _$ProfilesCopyWithImpl<$Res, Profiles>;
  @useResult
  $Res call({String id, String? name, String? avatarId, String? comment});
}

/// @nodoc
class _$ProfilesCopyWithImpl<$Res, $Val extends Profiles>
    implements $ProfilesCopyWith<$Res> {
  _$ProfilesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? avatarId = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarId: freezed == avatarId
          ? _value.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfilesImplCopyWith<$Res>
    implements $ProfilesCopyWith<$Res> {
  factory _$$ProfilesImplCopyWith(
          _$ProfilesImpl value, $Res Function(_$ProfilesImpl) then) =
      __$$ProfilesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name, String? avatarId, String? comment});
}

/// @nodoc
class __$$ProfilesImplCopyWithImpl<$Res>
    extends _$ProfilesCopyWithImpl<$Res, _$ProfilesImpl>
    implements _$$ProfilesImplCopyWith<$Res> {
  __$$ProfilesImplCopyWithImpl(
      _$ProfilesImpl _value, $Res Function(_$ProfilesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? avatarId = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$ProfilesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarId: freezed == avatarId
          ? _value.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfilesImpl implements _Profiles {
  const _$ProfilesImpl(
      {required this.id, this.name, this.avatarId, this.comment});

  factory _$ProfilesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfilesImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? avatarId;
  @override
  final String? comment;

  @override
  String toString() {
    return 'Profiles(id: $id, name: $name, avatarId: $avatarId, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarId, avatarId) ||
                other.avatarId == avatarId) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatarId, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilesImplCopyWith<_$ProfilesImpl> get copyWith =>
      __$$ProfilesImplCopyWithImpl<_$ProfilesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfilesImplToJson(
      this,
    );
  }
}

abstract class _Profiles implements Profiles {
  const factory _Profiles(
      {required final String id,
      final String? name,
      final String? avatarId,
      final String? comment}) = _$ProfilesImpl;

  factory _Profiles.fromJson(Map<String, dynamic> json) =
      _$ProfilesImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get avatarId;
  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$ProfilesImplCopyWith<_$ProfilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
