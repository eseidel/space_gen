// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class UsersAddEmailForAuthenticatedUserRequest {
  const UsersAddEmailForAuthenticatedUserRequest();

  factory UsersAddEmailForAuthenticatedUserRequest.fromJson(dynamic json) {
    return switch (json) {
      final Map<String, dynamic> v =>
        UsersAddEmailForAuthenticatedUserRequestOneOf0.fromJson(v),
      final List<dynamic> v => UsersAddEmailForAuthenticatedUserRequestList(
        v.cast<String>(),
      ),
      final String v => UsersAddEmailForAuthenticatedUserRequestString(v),
      _ => throw FormatException(
        'Unsupported shape for UsersAddEmailForAuthenticatedUserRequest: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersAddEmailForAuthenticatedUserRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return UsersAddEmailForAuthenticatedUserRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class UsersAddEmailForAuthenticatedUserRequestList
    extends UsersAddEmailForAuthenticatedUserRequest {
  const UsersAddEmailForAuthenticatedUserRequestList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersAddEmailForAuthenticatedUserRequestList &&
        value == other.value;
  }
}

@immutable
final class UsersAddEmailForAuthenticatedUserRequestString
    extends UsersAddEmailForAuthenticatedUserRequest {
  const UsersAddEmailForAuthenticatedUserRequestString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersAddEmailForAuthenticatedUserRequestString &&
        value == other.value;
  }
}

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
final class UsersAddEmailForAuthenticatedUserRequestOneOf0
    extends UsersAddEmailForAuthenticatedUserRequest {
  UsersAddEmailForAuthenticatedUserRequestOneOf0({required this.emails}) {
    emails.validate(minItems: 1);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersAddEmailForAuthenticatedUserRequestOneOf0].
  factory UsersAddEmailForAuthenticatedUserRequestOneOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersAddEmailForAuthenticatedUserRequestOneOf0',
      json,
      () => UsersAddEmailForAuthenticatedUserRequestOneOf0(
        emails: (json['emails'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersAddEmailForAuthenticatedUserRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersAddEmailForAuthenticatedUserRequestOneOf0.fromJson(json);
  }

  /// Adds one or more email addresses to your GitHub account. Must contain at
  /// least one email address. **Note:** Alternatively, you can pass a single
  /// email address or an `array` of emails addresses directly, but we
  /// recommend that you pass an object using the `emails` key.
  final List<String> emails;

  /// Converts a [UsersAddEmailForAuthenticatedUserRequestOneOf0]
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
    return other is UsersAddEmailForAuthenticatedUserRequestOneOf0 &&
        listsEqual(emails, other.emails);
  }
}
