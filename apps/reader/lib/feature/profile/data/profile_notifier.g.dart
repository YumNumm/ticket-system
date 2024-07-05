// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'profile_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileFromIdHash() => r'a2e7f853cace89557d1160b047c9f85f8be79778';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [profileFromId].
@ProviderFor(profileFromId)
const profileFromIdProvider = ProfileFromIdFamily();

/// See also [profileFromId].
class ProfileFromIdFamily extends Family {
  /// See also [profileFromId].
  const ProfileFromIdFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'profileFromIdProvider';

  /// See also [profileFromId].
  ProfileFromIdProvider call(
    String userid,
  ) {
    return ProfileFromIdProvider(
      userid,
    );
  }

  @visibleForOverriding
  @override
  ProfileFromIdProvider getProviderOverride(
    covariant ProfileFromIdProvider provider,
  ) {
    return call(
      provider.userid,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Profiles> Function(ProfileFromIdRef ref) create) {
    return _$ProfileFromIdFamilyOverride(this, create);
  }
}

class _$ProfileFromIdFamilyOverride implements FamilyOverride {
  _$ProfileFromIdFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Profiles> Function(ProfileFromIdRef ref) create;

  @override
  final ProfileFromIdFamily overriddenFamily;

  @override
  ProfileFromIdProvider getProviderOverride(
    covariant ProfileFromIdProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [profileFromId].
class ProfileFromIdProvider extends AutoDisposeFutureProvider<Profiles> {
  /// See also [profileFromId].
  ProfileFromIdProvider(
    String userid,
  ) : this._internal(
          (ref) => profileFromId(
            ref as ProfileFromIdRef,
            userid,
          ),
          from: profileFromIdProvider,
          name: r'profileFromIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profileFromIdHash,
          dependencies: ProfileFromIdFamily._dependencies,
          allTransitiveDependencies:
              ProfileFromIdFamily._allTransitiveDependencies,
          userid: userid,
        );

  ProfileFromIdProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userid,
  }) : super.internal();

  final String userid;

  @override
  Override overrideWith(
    FutureOr<Profiles> Function(ProfileFromIdRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProfileFromIdProvider._internal(
        (ref) => create(ref as ProfileFromIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userid: userid,
      ),
    );
  }

  @override
  (String,) get argument {
    return (userid,);
  }

  @override
  AutoDisposeFutureProviderElement<Profiles> createElement() {
    return _ProfileFromIdProviderElement(this);
  }

  ProfileFromIdProvider _copyWith(
    FutureOr<Profiles> Function(ProfileFromIdRef ref) create,
  ) {
    return ProfileFromIdProvider._internal(
      (ref) => create(ref as ProfileFromIdRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      userid: userid,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileFromIdProvider && other.userid == userid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProfileFromIdRef on AutoDisposeFutureProviderRef<Profiles> {
  /// The parameter `userid` of this provider.
  String get userid;
}

class _ProfileFromIdProviderElement
    extends AutoDisposeFutureProviderElement<Profiles> with ProfileFromIdRef {
  _ProfileFromIdProviderElement(super.provider);

  @override
  String get userid => (origin as ProfileFromIdProvider).userid;
}

String _$profileNotifierHash() => r'9b868312a8e62fc5fc5ab3b839a1d819d2000a40';

/// See also [ProfileNotifier].
@ProviderFor(ProfileNotifier)
final profileNotifierProvider =
    AsyncNotifierProvider<ProfileNotifier, Profiles>.internal(
  ProfileNotifier.new,
  name: r'profileNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfileNotifier = AsyncNotifier<Profiles>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
