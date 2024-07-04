// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'verify_purchase_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyPurchaseResponseImpl _$$VerifyPurchaseResponseImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$VerifyPurchaseResponseImpl',
      json,
      ($checkedConvert) {
        final val = _$VerifyPurchaseResponseImpl(
          success: $checkedConvert('success', (v) => v as bool),
          body: $checkedConvert('body', (v) => v as String?),
          reason: $checkedConvert('reason', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$VerifyPurchaseResponseImplToJson(
        _$VerifyPurchaseResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'body': instance.body,
      'reason': instance.reason,
    };
