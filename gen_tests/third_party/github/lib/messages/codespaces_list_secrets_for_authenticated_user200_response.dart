import 'package:github/model_helpers.dart';
import 'package:github/models/codespaces_secret.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesListSecretsForAuthenticatedUser200Response {
  const CodespacesListSecretsForAuthenticatedUser200Response({
    required this.totalCount,
    required this.secrets,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesListSecretsForAuthenticatedUser200Response].
  factory CodespacesListSecretsForAuthenticatedUser200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesListSecretsForAuthenticatedUser200Response',
      json,
      () => CodespacesListSecretsForAuthenticatedUser200Response(
        totalCount: json['total_count'] as int,
        secrets: (json['secrets'] as List)
            .map<CodespacesSecret>(
              (e) => CodespacesSecret.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesListSecretsForAuthenticatedUser200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesListSecretsForAuthenticatedUser200Response.fromJson(json);
  }

  final int totalCount;
  final List<CodespacesSecret> secrets;

  /// Converts a [CodespacesListSecretsForAuthenticatedUser200Response]
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
    return other is CodespacesListSecretsForAuthenticatedUser200Response &&
        totalCount == other.totalCount &&
        listsEqual(secrets, other.secrets);
  }
}
