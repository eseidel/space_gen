import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class MinimalRepositoryPermissions {
  const MinimalRepositoryPermissions({
    this.admin,
    this.maintain,
    this.push,
    this.triage,
    this.pull,
  });

  /// Converts a `Map<String, dynamic>` to a [MinimalRepositoryPermissions].
  factory MinimalRepositoryPermissions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MinimalRepositoryPermissions',
      json,
      () => MinimalRepositoryPermissions(
        admin: json['admin'] as bool?,
        maintain: json['maintain'] as bool?,
        push: json['push'] as bool?,
        triage: json['triage'] as bool?,
        pull: json['pull'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MinimalRepositoryPermissions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MinimalRepositoryPermissions.fromJson(json);
  }

  final bool? admin;
  final bool? maintain;
  final bool? push;
  final bool? triage;
  final bool? pull;

  /// Converts a [MinimalRepositoryPermissions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'maintain': maintain,
      'push': push,
      'triage': triage,
      'pull': pull,
    };
  }

  @override
  int get hashCode => Object.hashAll([admin, maintain, push, triage, pull]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MinimalRepositoryPermissions &&
        admin == other.admin &&
        maintain == other.maintain &&
        push == other.push &&
        triage == other.triage &&
        pull == other.pull;
  }
}
