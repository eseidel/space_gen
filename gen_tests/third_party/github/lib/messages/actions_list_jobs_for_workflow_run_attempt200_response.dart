import 'package:github/model_helpers.dart';
import 'package:github/models/job.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListJobsForWorkflowRunAttempt200Response {
  const ActionsListJobsForWorkflowRunAttempt200Response({
    required this.totalCount,
    required this.jobs,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListJobsForWorkflowRunAttempt200Response].
  factory ActionsListJobsForWorkflowRunAttempt200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListJobsForWorkflowRunAttempt200Response',
      json,
      () => ActionsListJobsForWorkflowRunAttempt200Response(
        totalCount: json['total_count'] as int,
        jobs: (json['jobs'] as List)
            .map<Job>((e) => Job.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListJobsForWorkflowRunAttempt200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListJobsForWorkflowRunAttempt200Response.fromJson(json);
  }

  final int totalCount;
  final List<Job> jobs;

  /// Converts an [ActionsListJobsForWorkflowRunAttempt200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'jobs': jobs.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(jobs)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsListJobsForWorkflowRunAttempt200Response &&
        totalCount == other.totalCount &&
        listsEqual(jobs, other.jobs);
  }
}
