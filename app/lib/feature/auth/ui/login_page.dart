import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:ticket_app/core/router/router.dart';

class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.all(16),
                    ),
                  ),
                  label: const Text('GitHubでログイン'),
                  icon: const Icon(Icons.login),
                  onPressed: () async {
                    final auth = Supabase.instance.client.auth;
                    final response = await auth.signInWithOAuth(
                      OAuthProvider.github,
                      redirectTo: kIsWeb
                          ? null
                          : 'net.yumnumm.ticketApp://login-callback/',
                      authScreenLaunchMode: LaunchMode.externalApplication,
                    );
                    log('response: $response');
                    ref.read(routerProvider).refresh();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
