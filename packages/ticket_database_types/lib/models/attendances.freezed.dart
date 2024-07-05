// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendances.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attendances _$AttendancesFromJson(Map<String, dynamic> json) {
  return _Attendances.fromJson(json);
}

/// @nodoc
mixin _$Attendances {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  AttendanceStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendancesCopyWith<Attendances> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendancesCopyWith<$Res> {
  factory $AttendancesCopyWith(
          Attendances value, $Res Function(Attendances) then) =
      _$AttendancesCopyWithImpl<$Res, Attendances>;
  @useResult
  $Res call(
      {String id, String userId, AttendanceStatus status, DateTime createdAt});
}

/// @nodoc
class _$AttendancesCopyWithImpl<$Res, $Val extends Attendances>
    implements $AttendancesCopyWith<$Res> {
  _$AttendancesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendanceStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendancesImplCopyWith<$Res>
    implements $AttendancesCopyWith<$Res> {
  factory _$$AttendancesImplCopyWith(
          _$AttendancesImpl value, $Res Function(_$AttendancesImpl) then) =
      __$$AttendancesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String userId, AttendanceStatus status, DateTime createdAt});
}

/// @nodoc
class __$$AttendancesImplCopyWithImpl<$Res>
    extends _$AttendancesCopyWithImpl<$Res, _$AttendancesImpl>
    implements _$$AttendancesImplCopyWith<$Res> {
  __$$AttendancesImplCopyWithImpl(
      _$AttendancesImpl _value, $Res Function(_$AttendancesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_$AttendancesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendanceStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendancesImpl implements _Attendances {
  const _$AttendancesImpl(
      {required this.id,
      required this.userId,
      required this.status,
      required this.createdAt});

  factory _$AttendancesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendancesImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final AttendanceStatus status;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Attendances(id: $id, userId: $userId, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendancesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, status, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendancesImplCopyWith<_$AttendancesImpl> get copyWith =>
      __$$AttendancesImplCopyWithImpl<_$AttendancesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendancesImplToJson(
      this,
    );
  }
}

abstract class _Attendances implements Attendances {
  const factory _Attendances(
      {required final String id,
      required final String userId,
      required final AttendanceStatus status,
      required final DateTime createdAt}) = _$AttendancesImpl;

  factory _Attendances.fromJson(Map<String, dynamic> json) =
      _$AttendancesImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  AttendanceStatus get status;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AttendancesImplCopyWith<_$AttendancesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
