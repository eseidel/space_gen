// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesListRepositoriesForSecretForAuthenticatedUser200Response {
  const CodespacesListRepositoriesForSecretForAuthenticatedUser200Response({
    required this.totalCount,
    required this.repositories,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesListRepositoriesForSecretForAuthenticatedUser200Response].
  factory CodespacesListRepositoriesForSecretForAuthenticatedUser200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesListRepositoriesForSecretForAuthenticatedUser200Response',
      json,
      () => CodespacesListRepositoriesForSecretForAuthenticatedUser200Response(
        totalCount: json['total_count'] as int,
        repositories: (json['repositories'] as List)
            .map<MinimalRepository>(
              (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesListRepositoriesForSecretForAuthenticatedUser200Response?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesListRepositoriesForSecretForAuthenticatedUser200Response.fromJson(
      json,
    );
  }

  final int totalCount;
  final List<MinimalRepository> repositories;

  /// Converts a [CodespacesListRepositoriesForSecretForAuthenticatedUser200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'repositories': repositories.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(repositories)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodespacesListRepositoriesForSecretForAuthenticatedUser200Response &&
        totalCount == other.totalCount &&
        listsEqual(repositories, other.repositories);
  }
}
