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
  Role get role => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatarName => throw _privateConstructorUsedError;
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
  $Res call(
      {String id,
      Role role,
      String? name,
      String? avatarName,
      String? comment});
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
    Object? role = null,
    Object? name = freezed,
    Object? avatarName = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarName: freezed == avatarName
          ? _value.avatarName
          : avatarName // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {String id,
      Role role,
      String? name,
      String? avatarName,
      String? comment});
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
    Object? role = null,
    Object? name = freezed,
    Object? avatarName = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$ProfilesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarName: freezed == avatarName
          ? _value.avatarName
          : avatarName // ignore: cast_nullable_to_non_nullable
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
      {required this.id,
      required this.role,
      this.name,
      this.avatarName,
      this.comment});

  factory _$ProfilesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfilesImplFromJson(json);

  @override
  final String id;
  @override
  final Role role;
  @override
  final String? name;
  @override
  final String? avatarName;
  @override
  final String? comment;

  @override
  String toString() {
    return 'Profiles(id: $id, role: $role, name: $name, avatarName: $avatarName, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarName, avatarName) ||
                other.avatarName == avatarName) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, role, name, avatarName, comment);

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
      required final Role role,
      final String? name,
      final String? avatarName,
      final String? comment}) = _$ProfilesImpl;

  factory _Profiles.fromJson(Map<String, dynamic> json) =
      _$ProfilesImpl.fromJson;

  @override
  String get id;
  @override
  Role get role;
  @override
  String? get name;
  @override
  String? get avatarName;
  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$ProfilesImplCopyWith<_$ProfilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
