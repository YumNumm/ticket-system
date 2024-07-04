import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_purchase_response.freezed.dart';
part 'verify_purchase_response.g.dart';

@freezed
class VerifyPurchaseResponse with _$VerifyPurchaseResponse {
  const factory VerifyPurchaseResponse({
    required bool success,
     String? body,
     String? reason,
  }) = _VerifyPurchaseResponse;

  factory VerifyPurchaseResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyPurchaseResponseFromJson(json);
}
