// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timetableHash() => r'6c5484f4deaa98802b488e778af7731a85aab802';

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

/// See also [timetable].
@ProviderFor(timetable)
const timetableProvider = TimetableFamily();

/// See also [timetable].
class TimetableFamily extends Family<AsyncValue<List<ExamScheduleResponse>>> {
  /// See also [timetable].
  const TimetableFamily();

  /// See also [timetable].
  TimetableProvider call({int? examSetupId}) {
    return TimetableProvider(examSetupId: examSetupId);
  }

  @override
  TimetableProvider getProviderOverride(covariant TimetableProvider provider) {
    return call(examSetupId: provider.examSetupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'timetableProvider';
}

/// See also [timetable].
class TimetableProvider
    extends AutoDisposeFutureProvider<List<ExamScheduleResponse>> {
  /// See also [timetable].
  TimetableProvider({int? examSetupId})
    : this._internal(
        (ref) => timetable(ref as TimetableRef, examSetupId: examSetupId),
        from: timetableProvider,
        name: r'timetableProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$timetableHash,
        dependencies: TimetableFamily._dependencies,
        allTransitiveDependencies: TimetableFamily._allTransitiveDependencies,
        examSetupId: examSetupId,
      );

  TimetableProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.examSetupId,
  }) : super.internal();

  final int? examSetupId;

  @override
  Override overrideWith(
    FutureOr<List<ExamScheduleResponse>> Function(TimetableRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TimetableProvider._internal(
        (ref) => create(ref as TimetableRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        examSetupId: examSetupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ExamScheduleResponse>> createElement() {
    return _TimetableProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TimetableProvider && other.examSetupId == examSetupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, examSetupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TimetableRef on AutoDisposeFutureProviderRef<List<ExamScheduleResponse>> {
  /// The parameter `examSetupId` of this provider.
  int? get examSetupId;
}

class _TimetableProviderElement
    extends AutoDisposeFutureProviderElement<List<ExamScheduleResponse>>
    with TimetableRef {
  _TimetableProviderElement(super.provider);

  @override
  int? get examSetupId => (origin as TimetableProvider).examSetupId;
}

String _$admitCardHash() => r'f9541c10a12573a2e282aba68df6e776ba2e24f8';

/// See also [admitCard].
@ProviderFor(admitCard)
const admitCardProvider = AdmitCardFamily();

/// See also [admitCard].
class AdmitCardFamily extends Family<AsyncValue<AdmitCardPreviewResponse>> {
  /// See also [admitCard].
  const AdmitCardFamily();

  /// See also [admitCard].
  AdmitCardProvider call(int examSetupId) {
    return AdmitCardProvider(examSetupId);
  }

  @override
  AdmitCardProvider getProviderOverride(covariant AdmitCardProvider provider) {
    return call(provider.examSetupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'admitCardProvider';
}

/// See also [admitCard].
class AdmitCardProvider
    extends AutoDisposeFutureProvider<AdmitCardPreviewResponse> {
  /// See also [admitCard].
  AdmitCardProvider(int examSetupId)
    : this._internal(
        (ref) => admitCard(ref as AdmitCardRef, examSetupId),
        from: admitCardProvider,
        name: r'admitCardProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$admitCardHash,
        dependencies: AdmitCardFamily._dependencies,
        allTransitiveDependencies: AdmitCardFamily._allTransitiveDependencies,
        examSetupId: examSetupId,
      );

  AdmitCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.examSetupId,
  }) : super.internal();

  final int examSetupId;

  @override
  Override overrideWith(
    FutureOr<AdmitCardPreviewResponse> Function(AdmitCardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdmitCardProvider._internal(
        (ref) => create(ref as AdmitCardRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        examSetupId: examSetupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AdmitCardPreviewResponse> createElement() {
    return _AdmitCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdmitCardProvider && other.examSetupId == examSetupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, examSetupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AdmitCardRef on AutoDisposeFutureProviderRef<AdmitCardPreviewResponse> {
  /// The parameter `examSetupId` of this provider.
  int get examSetupId;
}

class _AdmitCardProviderElement
    extends AutoDisposeFutureProviderElement<AdmitCardPreviewResponse>
    with AdmitCardRef {
  _AdmitCardProviderElement(super.provider);

  @override
  int get examSetupId => (origin as AdmitCardProvider).examSetupId;
}

String _$resultsHash() => r'8bc208f5c10b3ba05692f0f9a0c9e0fe9946ad68';

/// See also [results].
@ProviderFor(results)
final resultsProvider =
    AutoDisposeFutureProvider<List<StudentReportCardResponse>>.internal(
      results,
      name: r'resultsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$resultsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ResultsRef =
    AutoDisposeFutureProviderRef<List<StudentReportCardResponse>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
