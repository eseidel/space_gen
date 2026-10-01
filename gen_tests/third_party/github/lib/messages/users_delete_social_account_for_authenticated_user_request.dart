// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// Example:
/// ```json
/// {
///   "account_urls": [
///     "https://www.linkedin.com/company/github/",
///     "https://twitter.com/github"
///   ]
/// }
/// ```
@immutable
class UsersDeleteSocialAccountForAuthenticatedUserRequest {
  const UsersDeleteSocialAccountForAuthenticatedUserRequest({
    required this.accountUrls,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersDeleteSocialAccountForAuthenticatedUserRequest].
  factory UsersDeleteSocialAccountForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersDeleteSocialAccountForAuthenticatedUserRequest',
      json,
      () => UsersDeleteSocialAccountForAuthenticatedUserRequest(
        accountUrls: (json['account_urls'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersDeleteSocialAccountForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersDeleteSocialAccountForAuthenticatedUserRequest.fromJson(json);
  }

  /// Full URLs for the social media profiles to delete.
  final List<String> accountUrls;

  /// Converts a [UsersDeleteSocialAccountForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'account_urls': accountUrls};
  }

  @override
  int get hashCode => listHash(accountUrls).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersDeleteSocialAccountForAuthenticatedUserRequest &&
        listsEqual(accountUrls, other.accountUrls);
  }
}
