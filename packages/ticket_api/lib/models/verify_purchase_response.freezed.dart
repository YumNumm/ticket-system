// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_purchase_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyPurchaseResponse _$VerifyPurchaseResponseFromJson(
    Map<String, dynamic> json) {
  return _VerifyPurchaseResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyPurchaseResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyPurchaseResponseCopyWith<VerifyPurchaseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyPurchaseResponseCopyWith<$Res> {
  factory $VerifyPurchaseResponseCopyWith(VerifyPurchaseResponse value,
          $Res Function(VerifyPurchaseResponse) then) =
      _$VerifyPurchaseResponseCopyWithImpl<$Res, VerifyPurchaseResponse>;
  @useResult
  $Res call({bool success, String? body, String? reason});
}

/// @nodoc
class _$VerifyPurchaseResponseCopyWithImpl<$Res,
        $Val extends VerifyPurchaseResponse>
    implements $VerifyPurchaseResponseCopyWith<$Res> {
  _$VerifyPurchaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? body = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyPurchaseResponseImplCopyWith<$Res>
    implements $VerifyPurchaseResponseCopyWith<$Res> {
  factory _$$VerifyPurchaseResponseImplCopyWith(
          _$VerifyPurchaseResponseImpl value,
          $Res Function(_$VerifyPurchaseResponseImpl) then) =
      __$$VerifyPurchaseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? body, String? reason});
}

/// @nodoc
class __$$VerifyPurchaseResponseImplCopyWithImpl<$Res>
    extends _$VerifyPurchaseResponseCopyWithImpl<$Res,
        _$VerifyPurchaseResponseImpl>
    implements _$$VerifyPurchaseResponseImplCopyWith<$Res> {
  __$$VerifyPurchaseResponseImplCopyWithImpl(
      _$VerifyPurchaseResponseImpl _value,
      $Res Function(_$VerifyPurchaseResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? body = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$VerifyPurchaseResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyPurchaseResponseImpl implements _VerifyPurchaseResponse {
  const _$VerifyPurchaseResponseImpl(
      {required this.success, this.body, this.reason});

  factory _$VerifyPurchaseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyPurchaseResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String? body;
  @override
  final String? reason;

  @override
  String toString() {
    return 'VerifyPurchaseResponse(success: $success, body: $body, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyPurchaseResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, body, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyPurchaseResponseImplCopyWith<_$VerifyPurchaseResponseImpl>
      get copyWith => __$$VerifyPurchaseResponseImplCopyWithImpl<
          _$VerifyPurchaseResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyPurchaseResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifyPurchaseResponse implements VerifyPurchaseResponse {
  const factory _VerifyPurchaseResponse(
      {required final bool success,
      final String? body,
      final String? reason}) = _$VerifyPurchaseResponseImpl;

  factory _VerifyPurchaseResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyPurchaseResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get body;
  @override
  String? get reason;
  @override
  @JsonKey(ignore: true)
  _$$VerifyPurchaseResponseImplCopyWith<_$VerifyPurchaseResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
