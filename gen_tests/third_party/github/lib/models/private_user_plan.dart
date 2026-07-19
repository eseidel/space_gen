import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PrivateUserPlan {
  const PrivateUserPlan({
    required this.collaborators,
    required this.name,
    required this.space,
    required this.privateRepos,
  });

  /// Converts a `Map<String, dynamic>` to a [PrivateUserPlan].
  factory PrivateUserPlan.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PrivateUserPlan',
      json,
      () => PrivateUserPlan(
        collaborators: json['collaborators'] as int,
        name: json['name'] as String,
        space: json['space'] as int,
        privateRepos: json['private_repos'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PrivateUserPlan? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PrivateUserPlan.fromJson(json);
  }

  final int collaborators;
  final String name;
  final int space;
  final int privateRepos;

  /// Converts a [PrivateUserPlan] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'collaborators': collaborators,
      'name': name,
      'space': space,
      'private_repos': privateRepos,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([collaborators, name, space, privateRepos]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrivateUserPlan &&
        collaborators == other.collaborators &&
        name == other.name &&
        space == other.space &&
        privateRepos == other.privateRepos;
  }
}
