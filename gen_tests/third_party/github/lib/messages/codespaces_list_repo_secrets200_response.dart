import 'package:github/model_helpers.dart';
import 'package:github/models/repo_codespaces_secret.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesListRepoSecrets200Response {
  const CodespacesListRepoSecrets200Response({
    required this.totalCount,
    required this.secrets,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesListRepoSecrets200Response].
  factory CodespacesListRepoSecrets200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesListRepoSecrets200Response',
      json,
      () => CodespacesListRepoSecrets200Response(
        totalCount: json['total_count'] as int,
        secrets: (json['secrets'] as List)
            .map<RepoCodespacesSecret>(
              (e) => RepoCodespacesSecret.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesListRepoSecrets200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesListRepoSecrets200Response.fromJson(json);
  }

  final int totalCount;
  final List<RepoCodespacesSecret> secrets;

  /// Converts a [CodespacesListRepoSecrets200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'secrets': secrets.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(secrets)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesListRepoSecrets200Response &&
        totalCount == other.totalCount &&
        listsEqual(secrets, other.secrets);
  }
}
