// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/status_check_policy_checks_inner.dart';
import 'package:meta/meta.dart';

/// {@template status_check_policy}
/// Status Check Policy
/// Status Check Policy
/// {@endtemplate}
@immutable
class StatusCheckPolicy {
  /// {@macro status_check_policy}
  const StatusCheckPolicy({
    required this.url,
    required this.strict,
    required this.contexts,
    required this.checks,
    required this.contextsUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [StatusCheckPolicy].
  factory StatusCheckPolicy.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StatusCheckPolicy',
      json,
      () => StatusCheckPolicy(
        url: Uri.parse(json['url'] as String),
        strict: json['strict'] as bool,
        contexts: (json['contexts'] as List).cast<String>(),
        checks: (json['checks'] as List)
            .map<StatusCheckPolicyChecksInner>(
              (e) => StatusCheckPolicyChecksInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        contextsUrl: Uri.parse(json['contexts_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StatusCheckPolicy? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return StatusCheckPolicy.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/branches/master/protection/required_status_checks'`
  final Uri url;

  /// Example: `true`
  final bool strict;

  /// Example: `'continuous-integration/travis-ci'`
  final List<String> contexts;
  final List<StatusCheckPolicyChecksInner> checks;

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/branches/master/protection/required_status_checks/contexts'`
  final Uri contextsUrl;

  /// Converts a [StatusCheckPolicy] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'strict': strict,
      'contexts': contexts,
      'checks': checks.map((e) => e.toJson()).toList(),
      'contexts_url': contextsUrl.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    strict,
    listHash(contexts),
    listHash(checks),
    contextsUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StatusCheckPolicy &&
        url == other.url &&
        strict == other.strict &&
        listsEqual(contexts, other.contexts) &&
        listsEqual(checks, other.checks) &&
        contextsUrl == other.contextsUrl;
  }
}
