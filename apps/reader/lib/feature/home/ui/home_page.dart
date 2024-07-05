import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:ticket_reader/core/components/adaptive_sized_box.dart';
import 'package:ticket_reader/core/router/router.dart';
import 'package:ticket_reader/feature/auth/data/supabase_auth.dart';
import 'package:ticket_reader/feature/auth/ui/login_page.dart';
import 'package:ticket_reader/feature/profile/data/profile_notifier.dart';
import 'package:ticket_reader/feature/ticket/ui/ticket_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket System'),
      ),
      drawer: const _Drawer(),
      body: const _Body(),
    );
  }
}

class _Drawer extends ConsumerWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final profile = ref.watch(profileNotifierProvider);

    return Drawer(
      child: ListView(
        children: [
          switch (profile) {
            AsyncLoading() => const ListTile(
                title: Text('Loading profile...'),
              ),
            AsyncError(:final error) => ListTile(
                title: Text('Error: $error'),
              ),
            AsyncData(:final value) => UserAccountsDrawerHeader(
                accountEmail: Text(currentUser?.email ?? ''),
                accountName: Text(value.name ?? ''),
                currentAccountPicture: AvatarView(
                  profile: value,
                ),
              ),
          },
          ListTile(
            title: const Text('ログアウト'),
            leading: const Icon(Icons.logout),
            onTap: () async {
              unawaited(Supabase.instance.client.auth.signOut());
              const LoginRoute().go(context);
            },
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return AdaptiveSizedBox(
      child: ListView(
        children: const [
          TicketView(),
        ],
      ),
    );
  }
}
