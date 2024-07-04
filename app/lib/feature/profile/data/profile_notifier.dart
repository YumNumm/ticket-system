import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticket_app/feature/auth/data/supabase_auth.dart';
import 'package:ticket_app/feature/profile/data/profile_repository.dart';
import 'package:ticket_database/models/profiles.dart';

part 'profile_notifier.g.dart';

@Riverpod(keepAlive: true)
class ProfileNotifier extends _$ProfileNotifier {
  @override
  Future<Profiles> build() async {
    final user = ref.watch(currentUserProvider);
    if (user == null) {
      throw Exception('User is not logged in');
    }
    final repository = ref.watch(profileRepositoryProvider);
    return repository.getProfile(userId: user.id);
  }

  Future<void> updateName({
    required String name,
  }) async {
    final user = ref.read(currentUserProvider);
    if (user == null) {
      throw Exception('User is not logged in');
    }
    final repository = ref.read(profileRepositoryProvider);
    await repository.updateProfile(
      userId: user.id,
      name: name,
    );
  }

  Future<void> updateAvatar({
    required String avatarId,
  }) async {
    final user = ref.read(currentUserProvider);
    if (user == null) {
      throw Exception('User is not logged in');
    }
    final repository = ref.read(profileRepositoryProvider);
    await repository.updateProfile(
      userId: user.id,
      avatarId: avatarId,
    );
  }

  Future<void> updateComment({
    required String comment,
  }) async {
    final user = ref.read(currentUserProvider);
    if (user == null) {
      throw Exception('User is not logged in');
    }
    final repository = ref.read(profileRepositoryProvider);
    await repository.updateProfile(
      userId: user.id,
      comment: comment,
    );
  }
}
