import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UsersCreatePublicSshKeyForAuthenticatedUserRequest {
  const UsersCreatePublicSshKeyForAuthenticatedUserRequest({
    required this.key,
    this.title,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersCreatePublicSshKeyForAuthenticatedUserRequest].
  factory UsersCreatePublicSshKeyForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersCreatePublicSshKeyForAuthenticatedUserRequest',
      json,
      () => UsersCreatePublicSshKeyForAuthenticatedUserRequest(
        title: json['title'] as String?,
        key: json['key'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersCreatePublicSshKeyForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersCreatePublicSshKeyForAuthenticatedUserRequest.fromJson(json);
  }

  /// A descriptive name for the new key.
  /// Example: `'Personal MacBook Air'`
  final String? title;

  /// The public SSH key to add to your GitHub account.
  final String key;

  /// Converts a [UsersCreatePublicSshKeyForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'title': ?title, 'key': key};
  }

  @override
  int get hashCode => Object.hashAll([title, key]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersCreatePublicSshKeyForAuthenticatedUserRequest &&
        title == other.title &&
        key == other.key;
  }
}
