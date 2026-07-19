import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template classroom_assignment_grade}
/// Classroom Assignment Grade
/// Grade for a student or groups GitHub Classroom assignment
/// {@endtemplate}
@immutable
class ClassroomAssignmentGrade {
  /// {@macro classroom_assignment_grade}
  const ClassroomAssignmentGrade({
    required this.assignmentName,
    required this.assignmentUrl,
    required this.starterCodeUrl,
    required this.githubUsername,
    required this.rosterIdentifier,
    required this.studentRepositoryName,
    required this.studentRepositoryUrl,
    required this.submissionTimestamp,
    required this.pointsAwarded,
    required this.pointsAvailable,
    this.groupName,
  });

  /// Converts a `Map<String, dynamic>` to a [ClassroomAssignmentGrade].
  factory ClassroomAssignmentGrade.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ClassroomAssignmentGrade',
      json,
      () => ClassroomAssignmentGrade(
        assignmentName: json['assignment_name'] as String,
        assignmentUrl: json['assignment_url'] as String,
        starterCodeUrl: json['starter_code_url'] as String,
        githubUsername: json['github_username'] as String,
        rosterIdentifier: json['roster_identifier'] as String,
        studentRepositoryName: json['student_repository_name'] as String,
        studentRepositoryUrl: json['student_repository_url'] as String,
        submissionTimestamp: json['submission_timestamp'] as String,
        pointsAwarded: json['points_awarded'] as int,
        pointsAvailable: json['points_available'] as int,
        groupName: json['group_name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ClassroomAssignmentGrade? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ClassroomAssignmentGrade.fromJson(json);
  }

  /// Name of the assignment
  final String assignmentName;

  /// URL of the assignment
  final String assignmentUrl;

  /// URL of the starter code for the assignment
  final String starterCodeUrl;

  /// GitHub username of the student
  final String githubUsername;

  /// Roster identifier of the student
  final String rosterIdentifier;

  /// Name of the student's assignment repository
  final String studentRepositoryName;

  /// URL of the student's assignment repository
  final String studentRepositoryUrl;

  /// Timestamp of the student's assignment submission
  final String submissionTimestamp;

  /// Number of points awarded to the student
  final int pointsAwarded;

  /// Number of points available for the assignment
  final int pointsAvailable;

  /// If a group assignment, name of the group the student is in
  final String? groupName;

  /// Converts a [ClassroomAssignmentGrade] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'assignment_name': assignmentName,
      'assignment_url': assignmentUrl,
      'starter_code_url': starterCodeUrl,
      'github_username': githubUsername,
      'roster_identifier': rosterIdentifier,
      'student_repository_name': studentRepositoryName,
      'student_repository_url': studentRepositoryUrl,
      'submission_timestamp': submissionTimestamp,
      'points_awarded': pointsAwarded,
      'points_available': pointsAvailable,
      if (groupName != null) 'group_name': groupName,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    assignmentName,
    assignmentUrl,
    starterCodeUrl,
    githubUsername,
    rosterIdentifier,
    studentRepositoryName,
    studentRepositoryUrl,
    submissionTimestamp,
    pointsAwarded,
    pointsAvailable,
    groupName,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ClassroomAssignmentGrade &&
        assignmentName == other.assignmentName &&
        assignmentUrl == other.assignmentUrl &&
        starterCodeUrl == other.starterCodeUrl &&
        githubUsername == other.githubUsername &&
        rosterIdentifier == other.rosterIdentifier &&
        studentRepositoryName == other.studentRepositoryName &&
        studentRepositoryUrl == other.studentRepositoryUrl &&
        submissionTimestamp == other.submissionTimestamp &&
        pointsAwarded == other.pointsAwarded &&
        pointsAvailable == other.pointsAvailable &&
        groupName == other.groupName;
  }
}
