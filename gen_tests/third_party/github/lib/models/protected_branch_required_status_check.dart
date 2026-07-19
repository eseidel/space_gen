import 'package:github/model_helpers.dart';
import 'package:github/models/protected_branch_required_status_check_checks_inner.dart';
import 'package:meta/meta.dart';

/// {@template protected_branch_required_status_check}
/// Protected Branch Required Status Check
/// Protected Branch Required Status Check
/// {@endtemplate}
@immutable
class ProtectedBranchRequiredStatusCheck {
  /// {@macro protected_branch_required_status_check}
  const ProtectedBranchRequiredStatusCheck({
    required this.contexts,
    required this.checks,
    this.url,
    this.enforcementLevel,
    this.contextsUrl,
    this.strict,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ProtectedBranchRequiredStatusCheck].
  factory ProtectedBranchRequiredStatusCheck.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProtectedBranchRequiredStatusCheck',
      json,
      () => ProtectedBranchRequiredStatusCheck(
        url: json['url'] as String?,
        enforcementLevel: json['enforcement_level'] as String?,
        contexts: (json['contexts'] as List).cast<String>(),
        checks: (json['checks'] as List)
            .map<ProtectedBranchRequiredStatusCheckChecksInner>(
              (e) => ProtectedBranchRequiredStatusCheckChecksInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        contextsUrl: json['contexts_url'] as String?,
        strict: json['strict'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchRequiredStatusCheck? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchRequiredStatusCheck.fromJson(json);
  }

  final String? url;
  final String? enforcementLevel;
  final List<String> contexts;
  final List<ProtectedBranchRequiredStatusCheckChecksInner> checks;
  final String? contextsUrl;
  final bool? strict;

  /// Converts a [ProtectedBranchRequiredStatusCheck]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (url != null) 'url': url,
      if (enforcementLevel != null) 'enforcement_level': enforcementLevel,
      'contexts': contexts,
      'checks': checks.map((e) => e.toJson()).toList(),
      if (contextsUrl != null) 'contexts_url': contextsUrl,
      if (strict != null) 'strict': strict,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    enforcementLevel,
    listHash(contexts),
    listHash(checks),
    contextsUrl,
    strict,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchRequiredStatusCheck &&
        url == other.url &&
        enforcementLevel == other.enforcementLevel &&
        listsEqual(contexts, other.contexts) &&
        listsEqual(checks, other.checks) &&
        contextsUrl == other.contextsUrl &&
        strict == other.strict;
  }
}
