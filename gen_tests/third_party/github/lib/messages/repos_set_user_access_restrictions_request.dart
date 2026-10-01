// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// Example:
/// ```json
/// {
///   "users": [
///     "mona"
///   ]
/// }
/// ```
@immutable
class ReposSetUserAccessRestrictionsRequest {
  const ReposSetUserAccessRestrictionsRequest({required this.users});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposSetUserAccessRestrictionsRequest].
  factory ReposSetUserAccessRestrictionsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposSetUserAccessRestrictionsRequest',
      json,
      () => ReposSetUserAccessRestrictionsRequest(
        users: (json['users'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposSetUserAccessRestrictionsRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposSetUserAccessRestrictionsRequest.fromJson(json);
  }

  /// The username for users
  final List<String> users;

  /// Converts a [ReposSetUserAccessRestrictionsRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'users': users};
  }

  @override
  int get hashCode => listHash(users).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposSetUserAccessRestrictionsRequest &&
        listsEqual(users, other.users);
  }
}
