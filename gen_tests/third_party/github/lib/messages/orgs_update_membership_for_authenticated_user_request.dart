import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsUpdateMembershipForAuthenticatedUserRequest {
  const OrgsUpdateMembershipForAuthenticatedUserRequest();

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsUpdateMembershipForAuthenticatedUserRequest].
  factory OrgsUpdateMembershipForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsUpdateMembershipForAuthenticatedUserRequest',
      json,
      OrgsUpdateMembershipForAuthenticatedUserRequest.new,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsUpdateMembershipForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsUpdateMembershipForAuthenticatedUserRequest.fromJson(json);
  }

  /// The state that the membership should be in. Only `"active"` will be
  /// accepted.
  String get state => 'active';

  /// Converts an [OrgsUpdateMembershipForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'state': state};
  }

  @override
  int get hashCode => Object.hashAll([]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdateMembershipForAuthenticatedUserRequest;
  }
}
