// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_online_admission_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onlineAdmissionControllerHash() =>
    r'8550c51ac18daee6c837272942331137ab5c04e2';

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

abstract class _$OnlineAdmissionController
    extends BuildlessAutoDisposeAsyncNotifier<List<dynamic>> {
  late final String schoolId;

  FutureOr<List<dynamic>> build(String schoolId);
}

/// See also [OnlineAdmissionController].
@ProviderFor(OnlineAdmissionController)
const onlineAdmissionControllerProvider = OnlineAdmissionControllerFamily();

/// See also [OnlineAdmissionController].
class OnlineAdmissionControllerFamily
    extends Family<AsyncValue<List<dynamic>>> {
  /// See also [OnlineAdmissionController].
  const OnlineAdmissionControllerFamily();

  /// See also [OnlineAdmissionController].
  OnlineAdmissionControllerProvider call(String schoolId) {
    return OnlineAdmissionControllerProvider(schoolId);
  }

  @override
  OnlineAdmissionControllerProvider getProviderOverride(
    covariant OnlineAdmissionControllerProvider provider,
  ) {
    return call(provider.schoolId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'onlineAdmissionControllerProvider';
}

/// See also [OnlineAdmissionController].
class OnlineAdmissionControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          OnlineAdmissionController,
          List<dynamic>
        > {
  /// See also [OnlineAdmissionController].
  OnlineAdmissionControllerProvider(String schoolId)
    : this._internal(
        () => OnlineAdmissionController()..schoolId = schoolId,
        from: onlineAdmissionControllerProvider,
        name: r'onlineAdmissionControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$onlineAdmissionControllerHash,
        dependencies: OnlineAdmissionControllerFamily._dependencies,
        allTransitiveDependencies:
            OnlineAdmissionControllerFamily._allTransitiveDependencies,
        schoolId: schoolId,
      );

  OnlineAdmissionControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.schoolId,
  }) : super.internal();

  final String schoolId;

  @override
  FutureOr<List<dynamic>> runNotifierBuild(
    covariant OnlineAdmissionController notifier,
  ) {
    return notifier.build(schoolId);
  }

  @override
  Override overrideWith(OnlineAdmissionController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OnlineAdmissionControllerProvider._internal(
        () => create()..schoolId = schoolId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        schoolId: schoolId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    OnlineAdmissionController,
    List<dynamic>
  >
  createElement() {
    return _OnlineAdmissionControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnlineAdmissionControllerProvider &&
        other.schoolId == schoolId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, schoolId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OnlineAdmissionControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<dynamic>> {
  /// The parameter `schoolId` of this provider.
  String get schoolId;
}

class _OnlineAdmissionControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          OnlineAdmissionController,
          List<dynamic>
        >
    with OnlineAdmissionControllerRef {
  _OnlineAdmissionControllerProviderElement(super.provider);

  @override
  String get schoolId => (origin as OnlineAdmissionControllerProvider).schoolId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
