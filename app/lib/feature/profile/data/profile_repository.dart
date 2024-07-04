import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:ticket_database/models/profiles.dart';

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

  Future<void> updateProfile({
    required String userId,
    String? name,
    String? avatarId,
    String? comment,
  }) async =>
      _client.from('profiles').update({
        if (name != null) 'name': name,
        if (avatarId != null) 'avatar_id': avatarId,
        if (comment != null) 'comment': comment,
      }).eq(
        'id',
        userId,
      );
}
