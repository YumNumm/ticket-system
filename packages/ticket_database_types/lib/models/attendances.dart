import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendances.freezed.dart';
part 'attendances.g.dart';

@freezed
class Attendances with _$Attendances {
  const factory Attendances({
    required String id,
    required String userId,
    required AttendanceStatus status,
    required DateTime createdAt,
  }) = _Attendances;

  factory Attendances.fromJson(Map<String, dynamic> json) =>
      _$AttendancesFromJson(json);
}

enum AttendanceStatus {
  present,
  absent,
  ;
}
