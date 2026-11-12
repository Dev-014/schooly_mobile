// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_student_houses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentHousesControllerHash() =>
    r'cefcf93ccc015bf3ccdcd6bf76f69de3b593b6c6';

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

abstract class _$StudentHousesController
    extends BuildlessAutoDisposeAsyncNotifier<List<dynamic>> {
  late final String schoolId;

  FutureOr<List<dynamic>> build(String schoolId);
}

/// See also [StudentHousesController].
@ProviderFor(StudentHousesController)
const studentHousesControllerProvider = StudentHousesControllerFamily();

/// See also [StudentHousesController].
class StudentHousesControllerFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [StudentHousesController].
  const StudentHousesControllerFamily();

  /// See also [StudentHousesController].
  StudentHousesControllerProvider call(String schoolId) {
    return StudentHousesControllerProvider(schoolId);
  }

  @override
  StudentHousesControllerProvider getProviderOverride(
    covariant StudentHousesControllerProvider provider,
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
  String? get name => r'studentHousesControllerProvider';
}

/// See also [StudentHousesController].
class StudentHousesControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          StudentHousesController,
          List<dynamic>
        > {
  /// See also [StudentHousesController].
  StudentHousesControllerProvider(String schoolId)
    : this._internal(
        () => StudentHousesController()..schoolId = schoolId,
        from: studentHousesControllerProvider,
        name: r'studentHousesControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$studentHousesControllerHash,
        dependencies: StudentHousesControllerFamily._dependencies,
        allTransitiveDependencies:
            StudentHousesControllerFamily._allTransitiveDependencies,
        schoolId: schoolId,
      );

  StudentHousesControllerProvider._internal(
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
    covariant StudentHousesController notifier,
  ) {
    return notifier.build(schoolId);
  }

  @override
  Override overrideWith(StudentHousesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: StudentHousesControllerProvider._internal(
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
    StudentHousesController,
    List<dynamic>
  >
  createElement() {
    return _StudentHousesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentHousesControllerProvider &&
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
mixin StudentHousesControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<dynamic>> {
  /// The parameter `schoolId` of this provider.
  String get schoolId;
}

class _StudentHousesControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          StudentHousesController,
          List<dynamic>
        >
    with StudentHousesControllerRef {
  _StudentHousesControllerProviderElement(super.provider);

  @override
  String get schoolId => (origin as StudentHousesControllerProvider).schoolId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
