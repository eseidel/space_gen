import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesRemoveAssigneesRequest {
  const IssuesRemoveAssigneesRequest({this.assignees});

  /// Converts a `Map<String, dynamic>` to an [IssuesRemoveAssigneesRequest].
  factory IssuesRemoveAssigneesRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesRemoveAssigneesRequest',
      json,
      () => IssuesRemoveAssigneesRequest(
        assignees: (json['assignees'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesRemoveAssigneesRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesRemoveAssigneesRequest.fromJson(json);
  }

  /// Usernames of assignees to remove from an issue. _NOTE: Only users with
  /// push access can remove assignees from an issue. Assignees are silently
  /// ignored otherwise._
  final List<String>? assignees;

  /// Converts an [IssuesRemoveAssigneesRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'assignees': assignees};
  }

  @override
  int get hashCode => listHash(assignees).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesRemoveAssigneesRequest &&
        listsEqual(assignees, other.assignees);
  }
}
