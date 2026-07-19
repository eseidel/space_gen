import 'package:github/model_helpers.dart';
import 'package:github/models/repos_create_commit_status_request_state.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateCommitStatusRequest {
  const ReposCreateCommitStatusRequest({
    required this.state,
    this.targetUrl,
    this.description,
    this.context = 'default',
  });

  /// Converts a `Map<String, dynamic>` to a [ReposCreateCommitStatusRequest].
  factory ReposCreateCommitStatusRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateCommitStatusRequest',
      json,
      () => ReposCreateCommitStatusRequest(
        state: ReposCreateCommitStatusRequestState.fromJson(
          json['state'] as String,
        ),
        targetUrl: json['target_url'] as String?,
        description: json['description'] as String?,
        context: (json['context'] as String?) ?? 'default',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateCommitStatusRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateCommitStatusRequest.fromJson(json);
  }

  /// The state of the status.
  final ReposCreateCommitStatusRequestState state;

  /// The target URL to associate with this status. This URL will be linked
  /// from the GitHub UI to allow users to easily see the source of the
  /// status.
  /// For example, if your continuous integration system is posting build
  /// status, you would want to provide the deep link for the build output for
  /// this specific SHA:
  /// `http://ci.example.com/user/repo/build/sha`
  final String? targetUrl;

  /// A short description of the status.
  final String? description;

  /// A string label to differentiate this status from the status of other
  /// systems. This field is case-insensitive.
  final String context;

  /// Converts a [ReposCreateCommitStatusRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'state': state.toJson(),
      'target_url': targetUrl,
      'description': description,
      'context': context,
    };
  }

  @override
  int get hashCode => Object.hashAll([state, targetUrl, description, context]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateCommitStatusRequest &&
        state == other.state &&
        targetUrl == other.targetUrl &&
        description == other.description &&
        context == other.context;
  }
}
