// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authHash() => r'bea57aa46c5c49c6f6e11cbd35ce7ca82fe98303';

/// See also [Auth].
@ProviderFor(Auth)
final authProvider = AutoDisposeNotifierProvider<Auth, User?>.internal(
  Auth.new,
  name: r'authProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Auth = AutoDisposeNotifier<User?>;
String _$rbacHash() => r'bc546b064d64f41a645cfa4470b5b4d39f8890f0';

/// See also [Rbac].
@ProviderFor(Rbac)
final rbacProvider = AutoDisposeNotifierProvider<Rbac, bool>.internal(
  Rbac.new,
  name: r'rbacProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rbacHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Rbac = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
