import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class SnapshotJob {
  const SnapshotJob({required this.id, required this.correlator, this.htmlUrl});

  /// Converts a `Map<String, dynamic>` to a [SnapshotJob].
  factory SnapshotJob.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SnapshotJob',
      json,
      () => SnapshotJob(
        id: json['id'] as String,
        correlator: json['correlator'] as String,
        htmlUrl: json['html_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SnapshotJob? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SnapshotJob.fromJson(json);
  }

  /// The external ID of the job.
  /// Example: `'5622a2b0-63f6-4732-8c34-a1ab27e102a11'`
  final String id;

  /// Correlator provides a key that is used to group snapshots submitted over
  /// time. Only the "latest" submitted snapshot for a given combination of
  /// `job.correlator` and `detector.name` will be considered when calculating
  /// a repository's current dependencies. Correlator should be as unique as
  /// it takes to distinguish all detection runs for a given "wave" of CI
  /// workflow you run. If you're using GitHub Actions, a good default value
  /// for this could be the environment variables GITHUB_WORKFLOW and
  /// GITHUB_JOB concatenated together. If you're using a build matrix, then
  /// you'll also need to add additional key(s) to distinguish between each
  /// submission inside a matrix variation.
  /// Example: `'yourworkflowname_yourjobname'`
  final String correlator;

  /// The url for the job.
  /// Example: `'http://example.com/build'`
  final String? htmlUrl;

  /// Converts a [SnapshotJob] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id, 'correlator': correlator, 'html_url': htmlUrl};
  }

  @override
  int get hashCode => Object.hashAll([id, correlator, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SnapshotJob &&
        id == other.id &&
        correlator == other.correlator &&
        htmlUrl == other.htmlUrl;
  }
}
