import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class OrgMembershipPermissions {
  const OrgMembershipPermissions({required this.canCreateRepository});

  /// Converts a `Map<String, dynamic>` to an [OrgMembershipPermissions].
  factory OrgMembershipPermissions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgMembershipPermissions',
      json,
      () => OrgMembershipPermissions(
        canCreateRepository: json['can_create_repository'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgMembershipPermissions? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgMembershipPermissions.fromJson(json);
  }

  final bool canCreateRepository;

  /// Converts an [OrgMembershipPermissions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'can_create_repository': canCreateRepository};
  }

  @override
  int get hashCode => canCreateRepository.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgMembershipPermissions &&
        canCreateRepository == other.canCreateRepository;
  }
}
