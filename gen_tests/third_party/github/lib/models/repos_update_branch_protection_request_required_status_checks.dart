// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repos_update_branch_protection_request_required_status_checks_checks_inner.dart';
import 'package:meta/meta.dart';

/// {@template repos_update_branch_protection_request_required_status_checks}
/// Require status checks to pass before merging. Set to `null` to disable.
/// {@endtemplate}
@immutable
class ReposUpdateBranchProtectionRequestRequiredStatusChecks {
  /// {@macro repos_update_branch_protection_request_required_status_checks}
  const ReposUpdateBranchProtectionRequestRequiredStatusChecks({
    required this.strict,
    @deprecated required this.contexts,
    this.checks,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateBranchProtectionRequestRequiredStatusChecks].
  factory ReposUpdateBranchProtectionRequestRequiredStatusChecks.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateBranchProtectionRequestRequiredStatusChecks',
      json,
      () => ReposUpdateBranchProtectionRequestRequiredStatusChecks(
        strict: json['strict'] as bool,
        contexts: (json['contexts'] as List).cast<String>(),
        checks: (json['checks'] as List?)
            ?.map<
              ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner
            >(
              (e) =>
                  ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateBranchProtectionRequestRequiredStatusChecks? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateBranchProtectionRequestRequiredStatusChecks.fromJson(
      json,
    );
  }

  /// Require branches to be up to date before merging.
  final bool strict;

  /// **Closing down notice**: The list of status checks to require in order
  /// to merge into this branch. If any of these checks have recently been set
  /// by a particular GitHub App, they will be required to come from that app
  /// in future for the branch to merge. Use `checks` instead of `contexts`
  /// for more fine-grained control.
  @deprecated
  final List<String> contexts;

  /// The list of status checks to require in order to merge into this branch.
  final List<ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner>?
  checks;

  /// Converts a [ReposUpdateBranchProtectionRequestRequiredStatusChecks]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'strict': strict,
      'contexts': contexts,
      if (checks != null) 'checks': checks?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([strict, listHash(contexts), listHash(checks)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateBranchProtectionRequestRequiredStatusChecks &&
        strict == other.strict &&
        listsEqual(contexts, other.contexts) &&
        listsEqual(checks, other.checks);
  }
}
