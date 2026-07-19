import 'package:github/model_helpers.dart';
import 'package:github/models/codespace.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesListInOrganization200Response {
  const CodespacesListInOrganization200Response({
    required this.totalCount,
    required this.codespaces,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesListInOrganization200Response].
  factory CodespacesListInOrganization200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesListInOrganization200Response',
      json,
      () => CodespacesListInOrganization200Response(
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
  static CodespacesListInOrganization200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesListInOrganization200Response.fromJson(json);
  }

  final int totalCount;
  final List<Codespace> codespaces;

  /// Converts a [CodespacesListInOrganization200Response]
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
    return other is CodespacesListInOrganization200Response &&
        totalCount == other.totalCount &&
        listsEqual(codespaces, other.codespaces);
  }
}
