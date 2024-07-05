// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'ticket_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketFromUserIdHash() => r'a3a2aa11a2b3194997f04247817fe0cc54fa2813';

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

/// See also [ticketFromUserId].
@ProviderFor(ticketFromUserId)
const ticketFromUserIdProvider = TicketFromUserIdFamily();

/// See also [ticketFromUserId].
class TicketFromUserIdFamily extends Family {
  /// See also [ticketFromUserId].
  const TicketFromUserIdFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ticketFromUserIdProvider';

  /// See also [ticketFromUserId].
  TicketFromUserIdProvider call(
    String userId,
  ) {
    return TicketFromUserIdProvider(
      userId,
    );
  }

  @visibleForOverriding
  @override
  TicketFromUserIdProvider getProviderOverride(
    covariant TicketFromUserIdProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<Purchases?> Function(TicketFromUserIdRef ref) create) {
    return _$TicketFromUserIdFamilyOverride(this, create);
  }
}

class _$TicketFromUserIdFamilyOverride implements FamilyOverride {
  _$TicketFromUserIdFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Purchases?> Function(TicketFromUserIdRef ref) create;

  @override
  final TicketFromUserIdFamily overriddenFamily;

  @override
  TicketFromUserIdProvider getProviderOverride(
    covariant TicketFromUserIdProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [ticketFromUserId].
class TicketFromUserIdProvider extends AutoDisposeFutureProvider<Purchases?> {
  /// See also [ticketFromUserId].
  TicketFromUserIdProvider(
    String userId,
  ) : this._internal(
          (ref) => ticketFromUserId(
            ref as TicketFromUserIdRef,
            userId,
          ),
          from: ticketFromUserIdProvider,
          name: r'ticketFromUserIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ticketFromUserIdHash,
          dependencies: TicketFromUserIdFamily._dependencies,
          allTransitiveDependencies:
              TicketFromUserIdFamily._allTransitiveDependencies,
          userId: userId,
        );

  TicketFromUserIdProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<Purchases?> Function(TicketFromUserIdRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TicketFromUserIdProvider._internal(
        (ref) => create(ref as TicketFromUserIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  (String,) get argument {
    return (userId,);
  }

  @override
  AutoDisposeFutureProviderElement<Purchases?> createElement() {
    return _TicketFromUserIdProviderElement(this);
  }

  TicketFromUserIdProvider _copyWith(
    FutureOr<Purchases?> Function(TicketFromUserIdRef ref) create,
  ) {
    return TicketFromUserIdProvider._internal(
      (ref) => create(ref as TicketFromUserIdRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      userId: userId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TicketFromUserIdProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TicketFromUserIdRef on AutoDisposeFutureProviderRef<Purchases?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _TicketFromUserIdProviderElement
    extends AutoDisposeFutureProviderElement<Purchases?>
    with TicketFromUserIdRef {
  _TicketFromUserIdProviderElement(super.provider);

  @override
  String get userId => (origin as TicketFromUserIdProvider).userId;
}

String _$ticketNotifierHash() => r'a52cea881a6846fa9e83545573814d974556c8e7';

/// See also [TicketNotifier].
@ProviderFor(TicketNotifier)
final ticketNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TicketNotifier, Purchases?>.internal(
  TicketNotifier.new,
  name: r'ticketNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ticketNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TicketNotifier = AutoDisposeAsyncNotifier<Purchases?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
