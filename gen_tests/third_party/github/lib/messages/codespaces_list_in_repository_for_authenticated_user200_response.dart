import 'package:github/model_helpers.dart';
import 'package:github/models/codespace.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesListInRepositoryForAuthenticatedUser200Response {
  const CodespacesListInRepositoryForAuthenticatedUser200Response({
    required this.totalCount,
    required this.codespaces,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesListInRepositoryForAuthenticatedUser200Response].
  factory CodespacesListInRepositoryForAuthenticatedUser200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesListInRepositoryForAuthenticatedUser200Response',
      json,
      () => CodespacesListInRepositoryForAuthenticatedUser200Response(
        totalCount: json['total_count'] as int,
        codespaces: (json['codespaces'] as List)
            .map<Codespace>(
              (e) => Codespace.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesListInRepositoryForAuthenticatedUser200Response?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesListInRepositoryForAuthenticatedUser200Response.fromJson(
      json,
    );
  }

  final int totalCount;
  final List<Codespace> codespaces;

  /// Converts a [CodespacesListInRepositoryForAuthenticatedUser200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'codespaces': codespaces.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(codespaces)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesListInRepositoryForAuthenticatedUser200Response &&
        totalCount == other.totalCount &&
        listsEqual(codespaces, other.codespaces);
  }
}
