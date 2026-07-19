import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GithubCheckPullRequest {
  const GithubCheckPullRequest({required this.number});

  /// Converts a `Map<String, dynamic>` to a [GithubCheckPullRequest].
  factory GithubCheckPullRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubCheckPullRequest',
      json,
      () => GithubCheckPullRequest(number: json['number'] as int),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubCheckPullRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubCheckPullRequest.fromJson(json);
  }

  final int number;

  /// Converts a [GithubCheckPullRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'number': number};
  }

  @override
  int get hashCode => number.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubCheckPullRequest && number == other.number;
  }
}
