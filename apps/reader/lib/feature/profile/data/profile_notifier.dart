import 'dart:developer';
import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticket_database_types/models/profiles.dart';
import 'package:ticket_reader/feature/auth/data/supabase_auth.dart';
import 'package:ticket_reader/feature/profile/data/profile_repository.dart';

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
    state = const AsyncLoading<Profiles>().copyWithPrevious(state);
    final user = ref.read(currentUserProvider);
    if (user == null) {
      throw Exception('User is not logged in');
    }
    final repository = ref.read(profileRepositoryProvider);
    final result = await repository.updateProfile(
      userId: user.id,
      name: Value(name),
    );
    state = AsyncData(result);
  }

  Future<void> updateAvatar({
    required Uint8List bytes,
    required String path,
  }) async {
    state = const AsyncLoading<Profiles>().copyWithPrevious(state);
    final user = ref.read(currentUserProvider);
    if (user == null) {
      throw Exception('User is not logged in');
    }
    final repository = ref.read(profileRepositoryProvider);
    final uploadResult = await repository.uploadAvatar(
      path: path,
      bytes: bytes,
      userId: user.id,
      previousAvatarPath: state.valueOrNull?.avatarName,
    );
    log('uploadResult: $uploadResult');
    final avatarName = uploadResult;
    log('avatarName: $avatarName');

    final result = await repository.updateProfile(
      userId: user.id,
      avatarName: Value(avatarName),
    );
    log('updateAvatar: $result');
    state = AsyncData(result);
  }

  Future<void> updateComment({
    required String? comment,
  }) async {
    state = const AsyncLoading<Profiles>().copyWithPrevious(state);
    final user = ref.read(currentUserProvider);
    if (user == null) {
      throw Exception('User is not logged in');
    }
    log('comment: $comment, user: ${user.id}');
    final repository = ref.read(profileRepositoryProvider);
    final result = await repository.updateProfile(
      userId: user.id,
      comment: Value(comment),
    );
    state = AsyncData(result);
  }
}
