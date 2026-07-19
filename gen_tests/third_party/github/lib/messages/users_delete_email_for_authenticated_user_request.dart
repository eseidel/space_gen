// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class UsersDeleteEmailForAuthenticatedUserRequest {
  const UsersDeleteEmailForAuthenticatedUserRequest();

  factory UsersDeleteEmailForAuthenticatedUserRequest.fromJson(dynamic json) {
    return switch (json) {
      final Map<String, dynamic> v =>
        UsersDeleteEmailForAuthenticatedUserRequestOneOf0.fromJson(v),
      final List<dynamic> v => UsersDeleteEmailForAuthenticatedUserRequestList(
        v.cast<String>(),
      ),
      final String v => UsersDeleteEmailForAuthenticatedUserRequestString(v),
      _ => throw FormatException(
        'Unsupported shape for UsersDeleteEmailForAuthenticatedUserRequest: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersDeleteEmailForAuthenticatedUserRequest? maybeFromJson(
    dynamic json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersDeleteEmailForAuthenticatedUserRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class UsersDeleteEmailForAuthenticatedUserRequestList
    extends UsersDeleteEmailForAuthenticatedUserRequest {
  const UsersDeleteEmailForAuthenticatedUserRequestList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersDeleteEmailForAuthenticatedUserRequestList &&
        value == other.value;
  }
}

@immutable
final class UsersDeleteEmailForAuthenticatedUserRequestString
    extends UsersDeleteEmailForAuthenticatedUserRequest {
  const UsersDeleteEmailForAuthenticatedUserRequestString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersDeleteEmailForAuthenticatedUserRequestString &&
        value == other.value;
  }
}

/// {@template users_delete_email_for_authenticated_user_request_one_of_0}
/// Deletes one or more email addresses from your GitHub account. Must contain
/// at least one email address. **Note:** Alternatively, you can pass a single
/// email address or an `array` of emails addresses directly, but we recommend
/// that you pass an object using the `emails` key.
/// {@endtemplate}
/// Example:
/// ```json
/// {
///   "emails": [
///     "octocat@github.com",
///     "mona@github.com"
///   ]
/// }
/// ```
@immutable
final class UsersDeleteEmailForAuthenticatedUserRequestOneOf0
    extends UsersDeleteEmailForAuthenticatedUserRequest {
  /// {@macro users_delete_email_for_authenticated_user_request_one_of_0}
  const UsersDeleteEmailForAuthenticatedUserRequestOneOf0({
    required this.emails,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersDeleteEmailForAuthenticatedUserRequestOneOf0].
  factory UsersDeleteEmailForAuthenticatedUserRequestOneOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersDeleteEmailForAuthenticatedUserRequestOneOf0',
      json,
      () => UsersDeleteEmailForAuthenticatedUserRequestOneOf0(
        emails: (json['emails'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersDeleteEmailForAuthenticatedUserRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersDeleteEmailForAuthenticatedUserRequestOneOf0.fromJson(json);
  }

  /// Email addresses associated with the GitHub user account.
  final List<String> emails;

  /// Converts a [UsersDeleteEmailForAuthenticatedUserRequestOneOf0]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'emails': emails};
  }

  @override
  int get hashCode => listHash(emails).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersDeleteEmailForAuthenticatedUserRequestOneOf0 &&
        listsEqual(emails, other.emails);
  }
}
