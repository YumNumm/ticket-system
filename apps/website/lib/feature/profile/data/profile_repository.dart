import 'dart:developer';
import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:ticket_database/models/profiles.dart';
import 'package:uuid/uuid.dart';

part 'profile_repository.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(ProfileRepositoryRef ref) =>
    ProfileRepository(client: Supabase.instance.client);

class ProfileRepository {
  ProfileRepository({
    required SupabaseClient client,
  }) : _client = client;

  final SupabaseClient _client;

  Future<Profiles> getProfile({
    required String userId,
  }) =>
      _client
          .from('profiles')
          .select()
          .eq('id', userId)
          .single()
          .withConverter<Profiles>(Profiles.fromJson);

  Future<Profiles> updateProfile({
    required String userId,
    Value<String>? name,
    Value<String>? avatarName,
    Value<String>? comment,
  }) async {
    final result = await _client
        .from('profiles')
        .update({
          if (name != null) 'name': name.value,
          if (avatarName != null) 'avatar_name': avatarName.value,
          if (comment != null) 'comment': comment.value,
        })
        .eq(
          'id',
          userId,
        )
        .select()
        .single()
        .withConverter<Profiles>(Profiles.fromJson);
    log('updateProfile: $result');
    return result;
  }

  Future<String> uploadAvatar({
    required Uint8List bytes,
    required String path,
    required String userId,
    String? previousAvatarPath,
  }) async {
    final ext = path.split('.').last.toLowerCase();
    if (previousAvatarPath != null) {
      await _client.storage.from('avatars').remove([previousAvatarPath]);
    }
    return _client.storage.from('avatars').uploadBinary(
          '$userId/${const Uuid().v7()}.$ext',
          bytes,
          fileOptions: FileOptions(
            upsert: true,
            contentType: 'image/$ext',
          ),
        );
  }
}

class Value<T> {
  const Value(this.value);

  final T? value;
}
