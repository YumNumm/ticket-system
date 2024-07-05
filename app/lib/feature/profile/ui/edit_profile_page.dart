import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticket_app/core/router/router.dart';
import 'package:ticket_app/feature/profile/data/profile_notifier.dart';
import 'package:ticket_database/models/profiles.dart';

class EditProfileRoute extends GoRouteData {
  const EditProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EditProfilePage();
  }
}

class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: switch (state) {
        AsyncLoading() => const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 8),
                Text('Loading...'),
              ],
            ),
          ),
        AsyncError(:final error) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error, color: Colors.red),
                const SizedBox(height: 8),
                Text('Error: $error'),
              ],
            ),
          ),
        AsyncData(:final value) => _Body(profile: value),
      },
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({
    required this.profile,
  });

  final Profiles profile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editingProfile = useState(profile);
    final nameController = useTextEditingController(text: profile.name);
    final commentController = useTextEditingController(text: profile.comment);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: '名前',
              hintText: 'NO NAME',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: commentController,
            decoration: const InputDecoration(
              labelText: 'コメント',
            ),
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () async {
              final newProfile = editingProfile.value.copyWith(
                name: nameController.text,
                comment: commentController.text,
              );
              if (newProfile.name != profile.name && context.mounted) {
                log('updateName: ${newProfile.name}');
                await ref
                    .read(profileNotifierProvider.notifier)
                    .updateName(name: newProfile.name!);
              }
              if (newProfile.comment != profile.comment && context.mounted) {
                log('updateComment: ${newProfile.comment}');
                await ref
                    .read(profileNotifierProvider.notifier)
                    .updateComment(comment: newProfile.comment);
              }

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Saved!'),
                  ),
                );
                const HomeRoute().go(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
