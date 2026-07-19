// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UsersCreateSshSigningKeyForAuthenticatedUserRequest {
  const UsersCreateSshSigningKeyForAuthenticatedUserRequest({
    required this.key,
    this.title,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersCreateSshSigningKeyForAuthenticatedUserRequest].
  factory UsersCreateSshSigningKeyForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersCreateSshSigningKeyForAuthenticatedUserRequest',
      json,
      () => UsersCreateSshSigningKeyForAuthenticatedUserRequest(
        title: json['title'] as String?,
        key: json['key'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersCreateSshSigningKeyForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersCreateSshSigningKeyForAuthenticatedUserRequest.fromJson(json);
  }

  /// A descriptive name for the new key.
  /// Example: `'Personal MacBook Air'`
  final String? title;

  /// The public SSH key to add to your GitHub account. For more information,
  /// see "[Checking for existing SSH
  /// keys](https://docs.github.com/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys)."
  final String key;

  /// Converts a [UsersCreateSshSigningKeyForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'title': ?title, 'key': key};
  }

  @override
  int get hashCode => Object.hashAll([title, key]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersCreateSshSigningKeyForAuthenticatedUserRequest &&
        title == other.title &&
        key == other.key;
  }
}
