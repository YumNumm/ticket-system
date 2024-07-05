// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Purchases _$PurchasesFromJson(Map<String, dynamic> json) {
  return _Purchases.fromJson(json);
}

/// @nodoc
mixin _$Purchases {
  int get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchasesCopyWith<Purchases> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasesCopyWith<$Res> {
  factory $PurchasesCopyWith(Purchases value, $Res Function(Purchases) then) =
      _$PurchasesCopyWithImpl<$Res, Purchases>;
  @useResult
  $Res call({int id, String userId, String sessionId, DateTime createdAt});
}

/// @nodoc
class _$PurchasesCopyWithImpl<$Res, $Val extends Purchases>
    implements $PurchasesCopyWith<$Res> {
  _$PurchasesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? sessionId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchasesImplCopyWith<$Res>
    implements $PurchasesCopyWith<$Res> {
  factory _$$PurchasesImplCopyWith(
          _$PurchasesImpl value, $Res Function(_$PurchasesImpl) then) =
      __$$PurchasesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String userId, String sessionId, DateTime createdAt});
}

/// @nodoc
class __$$PurchasesImplCopyWithImpl<$Res>
    extends _$PurchasesCopyWithImpl<$Res, _$PurchasesImpl>
    implements _$$PurchasesImplCopyWith<$Res> {
  __$$PurchasesImplCopyWithImpl(
      _$PurchasesImpl _value, $Res Function(_$PurchasesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? sessionId = null,
    Object? createdAt = null,
  }) {
    return _then(_$PurchasesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchasesImpl implements _Purchases {
  const _$PurchasesImpl(
      {required this.id,
      required this.userId,
      required this.sessionId,
      required this.createdAt});

  factory _$PurchasesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchasesImplFromJson(json);

  @override
  final int id;
  @override
  final String userId;
  @override
  final String sessionId;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Purchases(id: $id, userId: $userId, sessionId: $sessionId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchasesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, sessionId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchasesImplCopyWith<_$PurchasesImpl> get copyWith =>
      __$$PurchasesImplCopyWithImpl<_$PurchasesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchasesImplToJson(
      this,
    );
  }
}

abstract class _Purchases implements Purchases {
  const factory _Purchases(
      {required final int id,
      required final String userId,
      required final String sessionId,
      required final DateTime createdAt}) = _$PurchasesImpl;

  factory _Purchases.fromJson(Map<String, dynamic> json) =
      _$PurchasesImpl.fromJson;

  @override
  int get id;
  @override
  String get userId;
  @override
  String get sessionId;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PurchasesImplCopyWith<_$PurchasesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
