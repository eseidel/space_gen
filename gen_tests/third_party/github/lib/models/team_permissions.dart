import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamPermissions {
  const TeamPermissions({
    required this.pull,
    required this.triage,
    required this.push,
    required this.maintain,
    required this.admin,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamPermissions].
  factory TeamPermissions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamPermissions',
      json,
      () => TeamPermissions(
        pull: json['pull'] as bool,
        triage: json['triage'] as bool,
        push: json['push'] as bool,
        maintain: json['maintain'] as bool,
        admin: json['admin'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamPermissions? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamPermissions.fromJson(json);
  }

  final bool pull;
  final bool triage;
  final bool push;
  final bool maintain;
  final bool admin;

  /// Converts a [TeamPermissions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'pull': pull,
      'triage': triage,
      'push': push,
      'maintain': maintain,
      'admin': admin,
    };
  }

  @override
  int get hashCode => Object.hashAll([pull, triage, push, maintain, admin]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamPermissions &&
        pull == other.pull &&
        triage == other.triage &&
        push == other.push &&
        maintain == other.maintain &&
        admin == other.admin;
  }
}
