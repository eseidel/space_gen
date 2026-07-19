import 'package:github/model_helpers.dart';
import 'package:github/models/job_steps_inner_status.dart';
import 'package:meta/meta.dart';

@immutable
class JobStepsInner {
  const JobStepsInner({
    required this.status,
    required this.conclusion,
    required this.name,
    required this.number,
    this.startedAt,
    this.completedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [JobStepsInner].
  factory JobStepsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'JobStepsInner',
      json,
      () => JobStepsInner(
        status: JobStepsInnerStatus.fromJson(json['status'] as String),
        conclusion: checkedKey(json, 'conclusion') as String?,
        name: json['name'] as String,
        number: json['number'] as int,
        startedAt: maybeParseDateTime(json['started_at'] as String?),
        completedAt: maybeParseDateTime(json['completed_at'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static JobStepsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return JobStepsInner.fromJson(json);
  }

  /// The phase of the lifecycle that the job is currently in.
  /// Example: `'queued'`
  final JobStepsInnerStatus status;

  /// The outcome of the job.
  /// Example: `'success'`
  final String? conclusion;

  /// The name of the job.
  /// Example: `'test-coverage'`
  final String name;

  /// Example: `1`
  final int number;

  /// The time that the step started, in ISO 8601 format.
  /// Example: `'2019-08-08T08:00:00-07:00'`
  final DateTime? startedAt;

  /// The time that the job finished, in ISO 8601 format.
  /// Example: `'2019-08-08T08:00:00-07:00'`
  final DateTime? completedAt;

  /// Converts a [JobStepsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'status': status.toJson(),
      'conclusion': conclusion,
      'name': name,
      'number': number,
      'started_at': startedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    status,
    conclusion,
    name,
    number,
    startedAt,
    completedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JobStepsInner &&
        status == other.status &&
        conclusion == other.conclusion &&
        name == other.name &&
        number == other.number &&
        startedAt == other.startedAt &&
        completedAt == other.completedAt;
  }
}
