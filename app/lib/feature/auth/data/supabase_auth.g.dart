// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'supabase_auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserHash() => r'7a5287c1034cdacd9624739730b403e6b66522ac';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = Provider<User?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = ProviderRef<User?>;
String _$supabaseAuthStateHash() => r'51400a8757dee5fb330e520a7b1f2c35c6459db0';

/// See also [_supabaseAuthState].
@ProviderFor(_supabaseAuthState)
final _supabaseAuthStateProvider = StreamProvider<AuthState>.internal(
  _supabaseAuthState,
  name: r'_supabaseAuthStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseAuthStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _SupabaseAuthStateRef = StreamProviderRef<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
