// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_student_siblings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentSiblingsControllerHash() =>
    r'61861272e84221b49d72f5f163228672c15afae8';

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

abstract class _$StudentSiblingsController
    extends BuildlessAutoDisposeAsyncNotifier<List<dynamic>> {
  late final String primaryStudentId;
  late final String schoolId;

  FutureOr<List<dynamic>> build(String primaryStudentId, String schoolId);
}

/// See also [StudentSiblingsController].
@ProviderFor(StudentSiblingsController)
const studentSiblingsControllerProvider = StudentSiblingsControllerFamily();

/// See also [StudentSiblingsController].
class StudentSiblingsControllerFamily
    extends Family<AsyncValue<List<dynamic>>> {
  /// See also [StudentSiblingsController].
  const StudentSiblingsControllerFamily();

  /// See also [StudentSiblingsController].
  StudentSiblingsControllerProvider call(
    String primaryStudentId,
    String schoolId,
  ) {
    return StudentSiblingsControllerProvider(primaryStudentId, schoolId);
  }

  @override
  StudentSiblingsControllerProvider getProviderOverride(
    covariant StudentSiblingsControllerProvider provider,
  ) {
    return call(provider.primaryStudentId, provider.schoolId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'studentSiblingsControllerProvider';
}

/// See also [StudentSiblingsController].
class StudentSiblingsControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          StudentSiblingsController,
          List<dynamic>
        > {
  /// See also [StudentSiblingsController].
  StudentSiblingsControllerProvider(String primaryStudentId, String schoolId)
    : this._internal(
        () => StudentSiblingsController()
          ..primaryStudentId = primaryStudentId
          ..schoolId = schoolId,
        from: studentSiblingsControllerProvider,
        name: r'studentSiblingsControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$studentSiblingsControllerHash,
        dependencies: StudentSiblingsControllerFamily._dependencies,
        allTransitiveDependencies:
            StudentSiblingsControllerFamily._allTransitiveDependencies,
        primaryStudentId: primaryStudentId,
        schoolId: schoolId,
      );

  StudentSiblingsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.primaryStudentId,
    required this.schoolId,
  }) : super.internal();

  final String primaryStudentId;
  final String schoolId;

  @override
  FutureOr<List<dynamic>> runNotifierBuild(
    covariant StudentSiblingsController notifier,
  ) {
    return notifier.build(primaryStudentId, schoolId);
  }

  @override
  Override overrideWith(StudentSiblingsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: StudentSiblingsControllerProvider._internal(
        () => create()
          ..primaryStudentId = primaryStudentId
          ..schoolId = schoolId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        primaryStudentId: primaryStudentId,
        schoolId: schoolId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    StudentSiblingsController,
    List<dynamic>
  >
  createElement() {
    return _StudentSiblingsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentSiblingsControllerProvider &&
        other.primaryStudentId == primaryStudentId &&
        other.schoolId == schoolId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, primaryStudentId.hashCode);
    hash = _SystemHash.combine(hash, schoolId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StudentSiblingsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<dynamic>> {
  /// The parameter `primaryStudentId` of this provider.
  String get primaryStudentId;

  /// The parameter `schoolId` of this provider.
  String get schoolId;
}

class _StudentSiblingsControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          StudentSiblingsController,
          List<dynamic>
        >
    with StudentSiblingsControllerRef {
  _StudentSiblingsControllerProviderElement(super.provider);

  @override
  String get primaryStudentId =>
      (origin as StudentSiblingsControllerProvider).primaryStudentId;
  @override
  String get schoolId => (origin as StudentSiblingsControllerProvider).schoolId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
