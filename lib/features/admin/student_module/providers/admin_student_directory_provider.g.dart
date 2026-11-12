// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_student_directory_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentDirectoryHash() => r'ae180eaf873894509039ce68440f857e8c05a12d';

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

/// See also [studentDirectory].
@ProviderFor(studentDirectory)
const studentDirectoryProvider = StudentDirectoryFamily();

/// See also [studentDirectory].
class StudentDirectoryFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [studentDirectory].
  const StudentDirectoryFamily();

  /// See also [studentDirectory].
  StudentDirectoryProvider call(String schoolId) {
    return StudentDirectoryProvider(schoolId);
  }

  @override
  StudentDirectoryProvider getProviderOverride(
    covariant StudentDirectoryProvider provider,
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
  String? get name => r'studentDirectoryProvider';
}

/// See also [studentDirectory].
class StudentDirectoryProvider
    extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [studentDirectory].
  StudentDirectoryProvider(String schoolId)
    : this._internal(
        (ref) => studentDirectory(ref as StudentDirectoryRef, schoolId),
        from: studentDirectoryProvider,
        name: r'studentDirectoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$studentDirectoryHash,
        dependencies: StudentDirectoryFamily._dependencies,
        allTransitiveDependencies:
            StudentDirectoryFamily._allTransitiveDependencies,
        schoolId: schoolId,
      );

  StudentDirectoryProvider._internal(
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
  Override overrideWith(
    FutureOr<List<dynamic>> Function(StudentDirectoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StudentDirectoryProvider._internal(
        (ref) => create(ref as StudentDirectoryRef),
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
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _StudentDirectoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentDirectoryProvider && other.schoolId == schoolId;
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
mixin StudentDirectoryRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `schoolId` of this provider.
  String get schoolId;
}

class _StudentDirectoryProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with StudentDirectoryRef {
  _StudentDirectoryProviderElement(super.provider);

  @override
  String get schoolId => (origin as StudentDirectoryProvider).schoolId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
