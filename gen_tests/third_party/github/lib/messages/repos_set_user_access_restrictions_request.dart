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
