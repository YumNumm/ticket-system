import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:ticket_app/core/router/router.dart';
import 'package:ticket_app/feature/auth/data/supabase_auth.dart';
import 'package:ticket_app/feature/auth/ui/login_page.dart';
import 'package:ticket_app/feature/ticket/ui/ticket_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currentUser = ref.watch(currentUserProvider);

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text(currentUser?.email ?? ''),
            accountName: Text(currentUser?.id ?? 'Logged out'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.black, size: 24),
            ),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
            ),
          ),
          ListTile(
            title: const Text('ログアウト'),
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
    final size = MediaQuery.sizeOf(context);
    final isLargeScreen = size.width > 600;
    return Center(
      child: SizedBox(
        width: isLargeScreen ? 600 : null,
        child: ListView(
          children: const [
            TicketView(),
          ],
        ),
      ),
    );
  }
}
