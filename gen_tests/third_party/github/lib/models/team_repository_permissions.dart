import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamRepositoryPermissions {
  const TeamRepositoryPermissions({
    required this.admin,
    required this.pull,
    required this.push,
    this.triage,
    this.maintain,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamRepositoryPermissions].
  factory TeamRepositoryPermissions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamRepositoryPermissions',
      json,
      () => TeamRepositoryPermissions(
        admin: json['admin'] as bool,
        pull: json['pull'] as bool,
        triage: json['triage'] as bool?,
        push: json['push'] as bool,
        maintain: json['maintain'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamRepositoryPermissions? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamRepositoryPermissions.fromJson(json);
  }

  final bool admin;
  final bool pull;
  final bool? triage;
  final bool push;
  final bool? maintain;

  /// Converts a [TeamRepositoryPermissions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'pull': pull,
      'triage': ?triage,
      'push': push,
      'maintain': ?maintain,
    };
  }

  @override
  int get hashCode => Object.hashAll([admin, pull, triage, push, maintain]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamRepositoryPermissions &&
        admin == other.admin &&
        pull == other.pull &&
        triage == other.triage &&
        push == other.push &&
        maintain == other.maintain;
  }
}
