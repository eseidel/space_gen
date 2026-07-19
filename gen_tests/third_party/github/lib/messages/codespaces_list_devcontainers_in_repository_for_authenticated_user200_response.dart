// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/codespaces_list_devcontainers_in_repository_for_authenticated_user200_response_devcontainers_inner.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response {
  const CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response({
    required this.totalCount,
    required this.devcontainers,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response].
  factory CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response',
      json,
      () => CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response(
        totalCount: json['total_count'] as int,
        devcontainers: (json['devcontainers'] as List)
            .map<
              CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner
            >(
              (e) =>
                  CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response.fromJson(
      json,
    );
  }

  final int totalCount;
  final List<
    CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner
  >
  devcontainers;

  /// Converts a [CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'devcontainers': devcontainers.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(devcontainers)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response &&
        totalCount == other.totalCount &&
        listsEqual(devcontainers, other.devcontainers);
  }
}
