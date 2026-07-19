// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/codespaces_pre_flight_with_repo_for_authenticated_user200_response_defaults.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesPreFlightWithRepoForAuthenticatedUser200Response {
  const CodespacesPreFlightWithRepoForAuthenticatedUser200Response({
    this.billableOwner,
    this.defaults,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesPreFlightWithRepoForAuthenticatedUser200Response].
  factory CodespacesPreFlightWithRepoForAuthenticatedUser200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesPreFlightWithRepoForAuthenticatedUser200Response',
      json,
      () => CodespacesPreFlightWithRepoForAuthenticatedUser200Response(
        billableOwner: SimpleUser.maybeFromJson(
          json['billable_owner'] as Map<String, dynamic>?,
        ),
        defaults:
            CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults.maybeFromJson(
              json['defaults'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesPreFlightWithRepoForAuthenticatedUser200Response?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesPreFlightWithRepoForAuthenticatedUser200Response.fromJson(
      json,
    );
  }

  /// Simple User
  /// A GitHub user.
  final SimpleUser? billableOwner;
  final CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults?
  defaults;

  /// Converts a [CodespacesPreFlightWithRepoForAuthenticatedUser200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'billable_owner': ?billableOwner?.toJson(),
      'defaults': ?defaults?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([billableOwner, defaults]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodespacesPreFlightWithRepoForAuthenticatedUser200Response &&
        billableOwner == other.billableOwner &&
        defaults == other.defaults;
  }
}
