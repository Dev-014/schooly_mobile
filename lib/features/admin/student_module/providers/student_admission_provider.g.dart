// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_admission_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesHash() => r'3136fd36c7951c04d2a0c27e2ea5c28be9cebeee';

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

/// See also [categories].
@ProviderFor(categories)
const categoriesProvider = CategoriesFamily();

/// See also [categories].
class CategoriesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [categories].
  const CategoriesFamily();

  /// See also [categories].
  CategoriesProvider call(String schoolId) {
    return CategoriesProvider(schoolId);
  }

  @override
  CategoriesProvider getProviderOverride(
    covariant CategoriesProvider provider,
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
  String? get name => r'categoriesProvider';
}

/// See also [categories].
class CategoriesProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [categories].
  CategoriesProvider(String schoolId)
    : this._internal(
        (ref) => categories(ref as CategoriesRef, schoolId),
        from: categoriesProvider,
        name: r'categoriesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$categoriesHash,
        dependencies: CategoriesFamily._dependencies,
        allTransitiveDependencies: CategoriesFamily._allTransitiveDependencies,
        schoolId: schoolId,
      );

  CategoriesProvider._internal(
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
    FutureOr<List<dynamic>> Function(CategoriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoriesProvider._internal(
        (ref) => create(ref as CategoriesRef),
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
    return _CategoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoriesProvider && other.schoolId == schoolId;
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
mixin CategoriesRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `schoolId` of this provider.
  String get schoolId;
}

class _CategoriesProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with CategoriesRef {
  _CategoriesProviderElement(super.provider);

  @override
  String get schoolId => (origin as CategoriesProvider).schoolId;
}

String _$housesHash() => r'c4ef75493773d423f4ca7391c34c0a0ca2655461';

/// See also [houses].
@ProviderFor(houses)
const housesProvider = HousesFamily();

/// See also [houses].
class HousesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [houses].
  const HousesFamily();

  /// See also [houses].
  HousesProvider call(String schoolId) {
    return HousesProvider(schoolId);
  }

  @override
  HousesProvider getProviderOverride(covariant HousesProvider provider) {
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
  String? get name => r'housesProvider';
}

/// See also [houses].
class HousesProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [houses].
  HousesProvider(String schoolId)
    : this._internal(
        (ref) => houses(ref as HousesRef, schoolId),
        from: housesProvider,
        name: r'housesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$housesHash,
        dependencies: HousesFamily._dependencies,
        allTransitiveDependencies: HousesFamily._allTransitiveDependencies,
        schoolId: schoolId,
      );

  HousesProvider._internal(
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
    FutureOr<List<dynamic>> Function(HousesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HousesProvider._internal(
        (ref) => create(ref as HousesRef),
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
    return _HousesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HousesProvider && other.schoolId == schoolId;
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
mixin HousesRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `schoolId` of this provider.
  String get schoolId;
}

class _HousesProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with HousesRef {
  _HousesProviderElement(super.provider);

  @override
  String get schoolId => (origin as HousesProvider).schoolId;
}

String _$classesHash() => r'2625ed1a3266ce357ca272c4ee21a7bc095af584';

/// See also [classes].
@ProviderFor(classes)
const classesProvider = ClassesFamily();

/// See also [classes].
class ClassesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [classes].
  const ClassesFamily();

  /// See also [classes].
  ClassesProvider call(String schoolId) {
    return ClassesProvider(schoolId);
  }

  @override
  ClassesProvider getProviderOverride(covariant ClassesProvider provider) {
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
  String? get name => r'classesProvider';
}

/// See also [classes].
class ClassesProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [classes].
  ClassesProvider(String schoolId)
    : this._internal(
        (ref) => classes(ref as ClassesRef, schoolId),
        from: classesProvider,
        name: r'classesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$classesHash,
        dependencies: ClassesFamily._dependencies,
        allTransitiveDependencies: ClassesFamily._allTransitiveDependencies,
        schoolId: schoolId,
      );

  ClassesProvider._internal(
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
    FutureOr<List<dynamic>> Function(ClassesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClassesProvider._internal(
        (ref) => create(ref as ClassesRef),
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
    return _ClassesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClassesProvider && other.schoolId == schoolId;
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
mixin ClassesRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `schoolId` of this provider.
  String get schoolId;
}

class _ClassesProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with ClassesRef {
  _ClassesProviderElement(super.provider);

  @override
  String get schoolId => (origin as ClassesProvider).schoolId;
}

String _$sectionsHash() => r'b8ca8701521104fd7d263a08078fa719b1b9b507';

/// See also [sections].
@ProviderFor(sections)
const sectionsProvider = SectionsFamily();

/// See also [sections].
class SectionsFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [sections].
  const SectionsFamily();

  /// See also [sections].
  SectionsProvider call(String schoolId, String classId) {
    return SectionsProvider(schoolId, classId);
  }

  @override
  SectionsProvider getProviderOverride(covariant SectionsProvider provider) {
    return call(provider.schoolId, provider.classId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sectionsProvider';
}

/// See also [sections].
class SectionsProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [sections].
  SectionsProvider(String schoolId, String classId)
    : this._internal(
        (ref) => sections(ref as SectionsRef, schoolId, classId),
        from: sectionsProvider,
        name: r'sectionsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$sectionsHash,
        dependencies: SectionsFamily._dependencies,
        allTransitiveDependencies: SectionsFamily._allTransitiveDependencies,
        schoolId: schoolId,
        classId: classId,
      );

  SectionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.schoolId,
    required this.classId,
  }) : super.internal();

  final String schoolId;
  final String classId;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(SectionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SectionsProvider._internal(
        (ref) => create(ref as SectionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        schoolId: schoolId,
        classId: classId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _SectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SectionsProvider &&
        other.schoolId == schoolId &&
        other.classId == classId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, schoolId.hashCode);
    hash = _SystemHash.combine(hash, classId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SectionsRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `schoolId` of this provider.
  String get schoolId;

  /// The parameter `classId` of this provider.
  String get classId;
}

class _SectionsProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with SectionsRef {
  _SectionsProviderElement(super.provider);

  @override
  String get schoolId => (origin as SectionsProvider).schoolId;
  @override
  String get classId => (origin as SectionsProvider).classId;
}

String _$academicYearsHash() => r'94d4ecf13192b004b92c68dd90e9fabc2ee3c230';

/// See also [academicYears].
@ProviderFor(academicYears)
const academicYearsProvider = AcademicYearsFamily();

/// See also [academicYears].
class AcademicYearsFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [academicYears].
  const AcademicYearsFamily();

  /// See also [academicYears].
  AcademicYearsProvider call(String schoolId) {
    return AcademicYearsProvider(schoolId);
  }

  @override
  AcademicYearsProvider getProviderOverride(
    covariant AcademicYearsProvider provider,
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
  String? get name => r'academicYearsProvider';
}

/// See also [academicYears].
class AcademicYearsProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [academicYears].
  AcademicYearsProvider(String schoolId)
    : this._internal(
        (ref) => academicYears(ref as AcademicYearsRef, schoolId),
        from: academicYearsProvider,
        name: r'academicYearsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$academicYearsHash,
        dependencies: AcademicYearsFamily._dependencies,
        allTransitiveDependencies:
            AcademicYearsFamily._allTransitiveDependencies,
        schoolId: schoolId,
      );

  AcademicYearsProvider._internal(
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
    FutureOr<List<dynamic>> Function(AcademicYearsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AcademicYearsProvider._internal(
        (ref) => create(ref as AcademicYearsRef),
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
    return _AcademicYearsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AcademicYearsProvider && other.schoolId == schoolId;
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
mixin AcademicYearsRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `schoolId` of this provider.
  String get schoolId;
}

class _AcademicYearsProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with AcademicYearsRef {
  _AcademicYearsProviderElement(super.provider);

  @override
  String get schoolId => (origin as AcademicYearsProvider).schoolId;
}

String _$familySearchHash() => r'ee71e1e2193d2851538cc56ed5b49c14fd68b755';

/// See also [familySearch].
@ProviderFor(familySearch)
const familySearchProvider = FamilySearchFamily();

/// See also [familySearch].
class FamilySearchFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [familySearch].
  const FamilySearchFamily();

  /// See also [familySearch].
  FamilySearchProvider call(String query) {
    return FamilySearchProvider(query);
  }

  @override
  FamilySearchProvider getProviderOverride(
    covariant FamilySearchProvider provider,
  ) {
    return call(provider.query);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'familySearchProvider';
}

/// See also [familySearch].
class FamilySearchProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [familySearch].
  FamilySearchProvider(String query)
    : this._internal(
        (ref) => familySearch(ref as FamilySearchRef, query),
        from: familySearchProvider,
        name: r'familySearchProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$familySearchHash,
        dependencies: FamilySearchFamily._dependencies,
        allTransitiveDependencies:
            FamilySearchFamily._allTransitiveDependencies,
        query: query,
      );

  FamilySearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(FamilySearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FamilySearchProvider._internal(
        (ref) => create(ref as FamilySearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _FamilySearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FamilySearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FamilySearchRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FamilySearchProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with FamilySearchRef {
  _FamilySearchProviderElement(super.provider);

  @override
  String get query => (origin as FamilySearchProvider).query;
}

String _$studentAdmissionFormControllerHash() =>
    r'034ee9eadb2e04fa242b7836c6e4449e08806c68';

/// See also [StudentAdmissionFormController].
@ProviderFor(StudentAdmissionFormController)
final studentAdmissionFormControllerProvider =
    AutoDisposeNotifierProvider<
      StudentAdmissionFormController,
      StudentAdmissionFormState
    >.internal(
      StudentAdmissionFormController.new,
      name: r'studentAdmissionFormControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$studentAdmissionFormControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$StudentAdmissionFormController =
    AutoDisposeNotifier<StudentAdmissionFormState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
