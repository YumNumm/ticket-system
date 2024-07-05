import 'package:freezed_annotation/freezed_annotation.dart';

part 'profiles.freezed.dart';
part 'profiles.g.dart';

@freezed
class Profiles with _$Profiles {
  const factory Profiles({
    required String id,
    String? name,
    String? avatarName,
    String? comment,
  }) = _Profiles;

  factory Profiles.fromJson(Map<String, dynamic> json) =>
      _$ProfilesFromJson(json);
}
