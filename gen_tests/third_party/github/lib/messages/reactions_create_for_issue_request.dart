import 'package:github/model_helpers.dart';
import 'package:github/models/reactions_create_for_issue_request_content.dart';
import 'package:meta/meta.dart';

@immutable
class ReactionsCreateForIssueRequest {
  const ReactionsCreateForIssueRequest({required this.content});

  /// Converts a `Map<String, dynamic>` to a [ReactionsCreateForIssueRequest].
  factory ReactionsCreateForIssueRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReactionsCreateForIssueRequest',
      json,
      () => ReactionsCreateForIssueRequest(
        content: ReactionsCreateForIssueRequestContent.fromJson(
          json['content'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReactionsCreateForIssueRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReactionsCreateForIssueRequest.fromJson(json);
  }

  /// The [reaction
  /// type](https://docs.github.com/rest/reactions/reactions#about-reactions)
  /// to add to the issue.
  final ReactionsCreateForIssueRequestContent content;

  /// Converts a [ReactionsCreateForIssueRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'content': content.toJson()};
  }

  @override
  int get hashCode => content.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReactionsCreateForIssueRequest && content == other.content;
  }
}
