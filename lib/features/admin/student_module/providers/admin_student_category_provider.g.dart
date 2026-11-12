// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_student_category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentCategoryControllerHash() =>
    r'6c40fd5647f86e5907c7990205b77226c71e9d5b';

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

abstract class _$StudentCategoryController
    extends BuildlessAutoDisposeAsyncNotifier<List<dynamic>> {
  late final String schoolId;

  FutureOr<List<dynamic>> build(String schoolId);
}

/// See also [StudentCategoryController].
@ProviderFor(StudentCategoryController)
const studentCategoryControllerProvider = StudentCategoryControllerFamily();

/// See also [StudentCategoryController].
class StudentCategoryControllerFamily
    extends Family<AsyncValue<List<dynamic>>> {
  /// See also [StudentCategoryController].
  const StudentCategoryControllerFamily();

  /// See also [StudentCategoryController].
  StudentCategoryControllerProvider call(String schoolId) {
    return StudentCategoryControllerProvider(schoolId);
  }

  @override
  StudentCategoryControllerProvider getProviderOverride(
    covariant StudentCategoryControllerProvider provider,
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
  String? get name => r'studentCategoryControllerProvider';
}

/// See also [StudentCategoryController].
class StudentCategoryControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          StudentCategoryController,
          List<dynamic>
        > {
  /// See also [StudentCategoryController].
  StudentCategoryControllerProvider(String schoolId)
    : this._internal(
        () => StudentCategoryController()..schoolId = schoolId,
        from: studentCategoryControllerProvider,
        name: r'studentCategoryControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$studentCategoryControllerHash,
        dependencies: StudentCategoryControllerFamily._dependencies,
        allTransitiveDependencies:
            StudentCategoryControllerFamily._allTransitiveDependencies,
        schoolId: schoolId,
      );

  StudentCategoryControllerProvider._internal(
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
    covariant StudentCategoryController notifier,
  ) {
    return notifier.build(schoolId);
  }

  @override
  Override overrideWith(StudentCategoryController Function() create) {
    return ProviderOverride(
      origin: this,
      override: StudentCategoryControllerProvider._internal(
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
    StudentCategoryController,
    List<dynamic>
  >
  createElement() {
    return _StudentCategoryControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentCategoryControllerProvider &&
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
mixin StudentCategoryControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<dynamic>> {
  /// The parameter `schoolId` of this provider.
  String get schoolId;
}

class _StudentCategoryControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          StudentCategoryController,
          List<dynamic>
        >
    with StudentCategoryControllerRef {
  _StudentCategoryControllerProviderElement(super.provider);

  @override
  String get schoolId => (origin as StudentCategoryControllerProvider).schoolId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
