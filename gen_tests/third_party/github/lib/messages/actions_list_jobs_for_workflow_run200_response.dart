import 'package:github/model_helpers.dart';
import 'package:github/models/job.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListJobsForWorkflowRun200Response {
  const ActionsListJobsForWorkflowRun200Response({
    required this.totalCount,
    required this.jobs,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListJobsForWorkflowRun200Response].
  factory ActionsListJobsForWorkflowRun200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListJobsForWorkflowRun200Response',
      json,
      () => ActionsListJobsForWorkflowRun200Response(
        totalCount: json['total_count'] as int,
        jobs: (json['jobs'] as List)
            .map<Job>((e) => Job.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListJobsForWorkflowRun200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListJobsForWorkflowRun200Response.fromJson(json);
  }

  final int totalCount;
  final List<Job> jobs;

  /// Converts an [ActionsListJobsForWorkflowRun200Response]
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
    return other is ActionsListJobsForWorkflowRun200Response &&
        totalCount == other.totalCount &&
        listsEqual(jobs, other.jobs);
  }
}
