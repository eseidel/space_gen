import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PublicUserPlan {
  const PublicUserPlan({
    required this.collaborators,
    required this.name,
    required this.space,
    required this.privateRepos,
  });

  /// Converts a `Map<String, dynamic>` to a [PublicUserPlan].
  factory PublicUserPlan.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PublicUserPlan',
      json,
      () => PublicUserPlan(
        collaborators: json['collaborators'] as int,
        name: json['name'] as String,
        space: json['space'] as int,
        privateRepos: json['private_repos'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PublicUserPlan? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PublicUserPlan.fromJson(json);
  }

  final int collaborators;
  final String name;
  final int space;
  final int privateRepos;

  /// Converts a [PublicUserPlan] to a `Map<String, dynamic>`.
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
    return other is PublicUserPlan &&
        collaborators == other.collaborators &&
        name == other.name &&
        space == other.space &&
        privateRepos == other.privateRepos;
  }
}
