// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticket_reader/feature/auth/data/supabase_auth.dart';
import 'package:ticket_reader/feature/auth/ui/login_page.dart';
import 'package:ticket_reader/feature/home/ui/home_page.dart';
import 'package:ticket_reader/feature/profile/ui/edit_profile_page.dart';
import 'package:ticket_reader/feature/purchase/ui/on_purchased_page.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final router = GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      // 未ログインの場合は、ログインページへリダイレクト
      final isLoggedIn = ref.read(currentUserProvider) != null;
      log('${state.matchedLocation}: $isLoggedIn');
      if (!isLoggedIn && state.matchedLocation != const LoginRoute().location) {
        log('redirect to login: 未ログインです');
        return const LoginRoute().location;
      }
      // ログイン済みでログインページを開こうとした場合は、ホームページへリダイレクト
      if (isLoggedIn && state.matchedLocation == const LoginRoute().location) {
        log('redirect to home: ログイン済みです');
        return const HomeRoute().location;
      }
      log('redirectを行いません');
      return null;
    },
    initialLocation: ref.read(currentUserProvider) == null
        ? const LoginRoute().location
        : const HomeRoute().location,
    debugLogDiagnostics: kDebugMode,
  );
  ref.listen(currentUserProvider, (_, __) => router.refresh());
  return router;
}

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<LoginRoute>(
      path: 'login',
    ),
    TypedGoRoute<OnPurchasedRoute>(
      path: 'on_purchased',
    ),
    TypedGoRoute<EditProfileRoute>(
      path: 'edit_profile',
    ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
