import 'package:github/model_helpers.dart';
import 'package:github/models/repository.dart';
import 'package:meta/meta.dart';

/// {@template starred_repository}
/// Starred Repository
/// Starred Repository
/// {@endtemplate}
@immutable
class StarredRepository {
  /// {@macro starred_repository}
  const StarredRepository({required this.starredAt, required this.repo});

  /// Converts a `Map<String, dynamic>` to a [StarredRepository].
  factory StarredRepository.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StarredRepository',
      json,
      () => StarredRepository(
        starredAt: DateTime.parse(json['starred_at'] as String),
        repo: Repository.fromJson(json['repo'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StarredRepository? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return StarredRepository.fromJson(json);
  }

  final DateTime starredAt;

  /// Repository
  /// A repository on GitHub.
  final Repository repo;

  /// Converts a [StarredRepository] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'starred_at': starredAt.toIso8601String(), 'repo': repo.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([starredAt, repo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StarredRepository &&
        starredAt == other.starredAt &&
        repo == other.repo;
  }
}
