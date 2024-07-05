// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'attendance_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$attendanceNotifierHash() =>
    r'e24d6615a49afa48a1aeb5b1c8b84106192d3ea9';

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

abstract class _$AttendanceNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Attendances>> {
  late final String userId;

  FutureOr<List<Attendances>> build(
    String userId,
  );
}

/// See also [AttendanceNotifier].
@ProviderFor(AttendanceNotifier)
const attendanceNotifierProvider = AttendanceNotifierFamily();

/// See also [AttendanceNotifier].
class AttendanceNotifierFamily extends Family {
  /// See also [AttendanceNotifier].
  const AttendanceNotifierFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'attendanceNotifierProvider';

  /// See also [AttendanceNotifier].
  AttendanceNotifierProvider call(
    String userId,
  ) {
    return AttendanceNotifierProvider(
      userId,
    );
  }

  @visibleForOverriding
  @override
  AttendanceNotifierProvider getProviderOverride(
    covariant AttendanceNotifierProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(AttendanceNotifier Function() create) {
    return _$AttendanceNotifierFamilyOverride(this, create);
  }
}

class _$AttendanceNotifierFamilyOverride implements FamilyOverride {
  _$AttendanceNotifierFamilyOverride(this.overriddenFamily, this.create);

  final AttendanceNotifier Function() create;

  @override
  final AttendanceNotifierFamily overriddenFamily;

  @override
  AttendanceNotifierProvider getProviderOverride(
    covariant AttendanceNotifierProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [AttendanceNotifier].
class AttendanceNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AttendanceNotifier, List<Attendances>> {
  /// See also [AttendanceNotifier].
  AttendanceNotifierProvider(
    String userId,
  ) : this._internal(
          () => AttendanceNotifier()..userId = userId,
          from: attendanceNotifierProvider,
          name: r'attendanceNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$attendanceNotifierHash,
          dependencies: AttendanceNotifierFamily._dependencies,
          allTransitiveDependencies:
              AttendanceNotifierFamily._allTransitiveDependencies,
          userId: userId,
        );

  AttendanceNotifierProvider._internal(
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
  FutureOr<List<Attendances>> runNotifierBuild(
    covariant AttendanceNotifier notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(AttendanceNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: AttendanceNotifierProvider._internal(
        () => create()..userId = userId,
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
  AutoDisposeAsyncNotifierProviderElement<AttendanceNotifier, List<Attendances>>
      createElement() {
    return _AttendanceNotifierProviderElement(this);
  }

  AttendanceNotifierProvider _copyWith(
    AttendanceNotifier Function() create,
  ) {
    return AttendanceNotifierProvider._internal(
      () => create()..userId = userId,
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
    return other is AttendanceNotifierProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AttendanceNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Attendances>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _AttendanceNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AttendanceNotifier,
        List<Attendances>> with AttendanceNotifierRef {
  _AttendanceNotifierProviderElement(super.provider);

  @override
  String get userId => (origin as AttendanceNotifierProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
