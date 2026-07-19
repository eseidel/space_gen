import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesAddAssigneesRequest {
  const IssuesAddAssigneesRequest({this.assignees});

  /// Converts a `Map<String, dynamic>` to an [IssuesAddAssigneesRequest].
  factory IssuesAddAssigneesRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesAddAssigneesRequest',
      json,
      () => IssuesAddAssigneesRequest(
        assignees: (json['assignees'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesAddAssigneesRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssuesAddAssigneesRequest.fromJson(json);
  }

  /// Usernames of people to assign this issue to. _NOTE: Only users with push
  /// access can add assignees to an issue. Assignees are silently ignored
  /// otherwise._
  final List<String>? assignees;

  /// Converts an [IssuesAddAssigneesRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (assignees != null) 'assignees': assignees};
  }

  @override
  int get hashCode => listHash(assignees).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesAddAssigneesRequest &&
        listsEqual(assignees, other.assignees);
  }
}
