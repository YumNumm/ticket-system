import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_auth.g.dart';

@Riverpod(keepAlive: true)
User? currentUser(CurrentUserRef ref) {
  final auth = Supabase.instance.client.auth;
  ref.listen(_supabaseAuthStateProvider, (_, __) => ref.invalidateSelf());
  return auth.currentUser;
}

@Riverpod(keepAlive: true)
Stream<AuthState> _supabaseAuthState(_SupabaseAuthStateRef ref) =>
    Supabase.instance.client.auth.onAuthStateChange;
