import 'package:github/model_helpers.dart';
import 'package:github/models/repos_update_status_check_protection_request_checks_inner.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateStatusCheckProtectionRequest {
  const ReposUpdateStatusCheckProtectionRequest({
    this.strict,
    @deprecated this.contexts,
    this.checks,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateStatusCheckProtectionRequest].
  factory ReposUpdateStatusCheckProtectionRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateStatusCheckProtectionRequest',
      json,
      () => ReposUpdateStatusCheckProtectionRequest(
        strict: json['strict'] as bool?,
        contexts: (json['contexts'] as List?)?.cast<String>(),
        checks: (json['checks'] as List?)
            ?.map<ReposUpdateStatusCheckProtectionRequestChecksInner>(
              (e) =>
                  ReposUpdateStatusCheckProtectionRequestChecksInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateStatusCheckProtectionRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateStatusCheckProtectionRequest.fromJson(json);
  }

  /// Require branches to be up to date before merging.
  final bool? strict;

  /// **Closing down notice**: The list of status checks to require in order
  /// to merge into this branch. If any of these checks have recently been set
  /// by a particular GitHub App, they will be required to come from that app
  /// in future for the branch to merge. Use `checks` instead of `contexts`
  /// for more fine-grained control.
  @deprecated
  final List<String>? contexts;

  /// The list of status checks to require in order to merge into this branch.
  final List<ReposUpdateStatusCheckProtectionRequestChecksInner>? checks;

  /// Converts a [ReposUpdateStatusCheckProtectionRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'strict': ?strict,
      'contexts': ?contexts,
      'checks': ?checks?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([strict, listHash(contexts), listHash(checks)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateStatusCheckProtectionRequest &&
        strict == other.strict &&
        listsEqual(contexts, other.contexts) &&
        listsEqual(checks, other.checks);
  }
}
