// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template integration_permissions}
/// The set of permissions for the GitHub app
/// {@endtemplate}
/// Example:
/// ```json
/// {
///   "issues": "read",
///   "deployments": "write"
/// }
/// ```
@immutable
class IntegrationPermissions {
  /// {@macro integration_permissions}
  const IntegrationPermissions({
    required this.entries,
    this.issues,
    this.checks,
    this.metadata,
    this.contents,
    this.deployments,
  });

  /// Converts a `Map<String, dynamic>` to an [IntegrationPermissions].
  factory IntegrationPermissions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IntegrationPermissions',
      json,
      () => IntegrationPermissions(
        issues: json['issues'] as String?,
        checks: json['checks'] as String?,
        metadata: json['metadata'] as String?,
        contents: json['contents'] as String?,
        deployments: json['deployments'] as String?,
        entries: <String, String>{
          for (final entry in json.entries)
            if (!const {
              'issues',
              'checks',
              'metadata',
              'contents',
              'deployments',
            }.contains(entry.key))
              entry.key: entry.value as String,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IntegrationPermissions? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IntegrationPermissions.fromJson(json);
  }

  final String? issues;
  final String? checks;
  final String? metadata;
  final String? contents;
  final String? deployments;
  final Map<String, String> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  String? operator [](String key) => switch (key) {
    'issues' => issues,
    'checks' => checks,
    'metadata' => metadata,
    'contents' => contents,
    'deployments' => deployments,
    _ => entries[key],
  };

  /// Converts an [IntegrationPermissions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'issues': ?issues,
      'checks': ?checks,
      'metadata': ?metadata,
      'contents': ?contents,
      'deployments': ?deployments,
      for (final entry in entries.entries)
        if (!const {
          'issues',
          'checks',
          'metadata',
          'contents',
          'deployments',
        }.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    issues,
    checks,
    metadata,
    contents,
    deployments,
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IntegrationPermissions &&
        issues == other.issues &&
        checks == other.checks &&
        metadata == other.metadata &&
        contents == other.contents &&
        deployments == other.deployments &&
        mapsEqual(entries, other.entries);
  }
}
