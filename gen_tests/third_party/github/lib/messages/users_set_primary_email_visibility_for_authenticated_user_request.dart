// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/users_set_primary_email_visibility_for_authenticated_user_request_visibility.dart';
import 'package:meta/meta.dart';

@immutable
class UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest {
  const UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest({
    required this.visibility,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest].
  factory UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest',
      json,
      () => UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest(
        visibility:
            UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequestVisibility.fromJson(
              json['visibility'] as String,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest.fromJson(
      json,
    );
  }

  /// Denotes whether an email is publicly visible.
  final UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequestVisibility
  visibility;

  /// Converts a [UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'visibility': visibility.toJson()};
  }

  @override
  int get hashCode => visibility.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest &&
        visibility == other.visibility;
  }
}
