import 'package:github/model_helpers.dart';
import 'package:github/models/codespaces_org_secret.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesListOrgSecrets200Response {
  const CodespacesListOrgSecrets200Response({
    required this.totalCount,
    required this.secrets,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesListOrgSecrets200Response].
  factory CodespacesListOrgSecrets200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesListOrgSecrets200Response',
      json,
      () => CodespacesListOrgSecrets200Response(
        totalCount: json['total_count'] as int,
        secrets: (json['secrets'] as List)
            .map<CodespacesOrgSecret>(
              (e) => CodespacesOrgSecret.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesListOrgSecrets200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesListOrgSecrets200Response.fromJson(json);
  }

  final int totalCount;
  final List<CodespacesOrgSecret> secrets;

  /// Converts a [CodespacesListOrgSecrets200Response]
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
    return other is CodespacesListOrgSecrets200Response &&
        totalCount == other.totalCount &&
        listsEqual(secrets, other.secrets);
  }
}
