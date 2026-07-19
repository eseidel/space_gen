import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamProjectPermissions {
  const TeamProjectPermissions({
    required this.read,
    required this.write,
    required this.admin,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamProjectPermissions].
  factory TeamProjectPermissions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamProjectPermissions',
      json,
      () => TeamProjectPermissions(
        read: json['read'] as bool,
        write: json['write'] as bool,
        admin: json['admin'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamProjectPermissions? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamProjectPermissions.fromJson(json);
  }

  final bool read;
  final bool write;
  final bool admin;

  /// Converts a [TeamProjectPermissions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'read': read, 'write': write, 'admin': admin};
  }

  @override
  int get hashCode => Object.hashAll([read, write, admin]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamProjectPermissions &&
        read == other.read &&
        write == other.write &&
        admin == other.admin;
  }
}
