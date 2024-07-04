import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchases.freezed.dart';
part 'purchases.g.dart';

@freezed
class Purchases with _$Purchases {
  const factory Purchases({
    required int id,
    required String userId,
    required String sessionId,
    required DateTime createdAt,
  }) = _Purchases;

  factory Purchases.fromJson(Map<String, dynamic> json) =>
      _$PurchasesFromJson(json);
}
