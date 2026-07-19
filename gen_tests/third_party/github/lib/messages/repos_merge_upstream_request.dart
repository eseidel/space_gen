import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposMergeUpstreamRequest {
  const ReposMergeUpstreamRequest({required this.branch});

  /// Converts a `Map<String, dynamic>` to a [ReposMergeUpstreamRequest].
  factory ReposMergeUpstreamRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposMergeUpstreamRequest',
      json,
      () => ReposMergeUpstreamRequest(branch: json['branch'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposMergeUpstreamRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposMergeUpstreamRequest.fromJson(json);
  }

  /// The name of the branch which should be updated to match upstream.
  final String branch;

  /// Converts a [ReposMergeUpstreamRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'branch': branch};
  }

  @override
  int get hashCode => branch.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposMergeUpstreamRequest && branch == other.branch;
  }
}
