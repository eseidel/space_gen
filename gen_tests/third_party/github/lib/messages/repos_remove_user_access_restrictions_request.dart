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
class ReposRemoveUserAccessRestrictionsRequest {
  const ReposRemoveUserAccessRestrictionsRequest({required this.users});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposRemoveUserAccessRestrictionsRequest].
  factory ReposRemoveUserAccessRestrictionsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposRemoveUserAccessRestrictionsRequest',
      json,
      () => ReposRemoveUserAccessRestrictionsRequest(
        users: (json['users'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposRemoveUserAccessRestrictionsRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposRemoveUserAccessRestrictionsRequest.fromJson(json);
  }

  /// The username for users
  final List<String> users;

  /// Converts a [ReposRemoveUserAccessRestrictionsRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'users': users};
  }

  @override
  int get hashCode => listHash(users).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposRemoveUserAccessRestrictionsRequest &&
        listsEqual(users, other.users);
  }
}
