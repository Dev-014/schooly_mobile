import '../../features/auth/domain/user.dart';

extension UserPermissionsExtension on User {
  /// Checks if the user has a specific permission key
  bool hasPermission(String permissionKey) {
    if (role?.toUpperCase() == 'ADMIN') return true;
    if (permissions == null) return false;
    return permissions!.any((p) => p.key == permissionKey || p.key == 'ALL');
  }

  /// Checks if the user has ANY of the provided permission keys
  bool hasAnyPermission(List<String> permissionKeys) {
    if (role?.toUpperCase() == 'ADMIN') return true;
    if (permissions == null) return false;
    return permissions!.any(
      (p) => permissionKeys.contains(p.key) || p.key == 'ALL',
    );
  }
}
