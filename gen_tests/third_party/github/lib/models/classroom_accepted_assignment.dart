import 'package:github/model_helpers.dart';
import 'package:github/models/simple_classroom_assignment.dart';
import 'package:github/models/simple_classroom_repository.dart';
import 'package:github/models/simple_classroom_user.dart';
import 'package:meta/meta.dart';

/// {@template classroom_accepted_assignment}
/// Classroom Accepted Assignment
/// A GitHub Classroom accepted assignment
/// {@endtemplate}
@immutable
class ClassroomAcceptedAssignment {
  /// {@macro classroom_accepted_assignment}
  const ClassroomAcceptedAssignment({
    required this.id,
    required this.submitted,
    required this.passing,
    required this.commitCount,
    required this.grade,
    required this.students,
    required this.repository,
    required this.assignment,
  });

  /// Converts a `Map<String, dynamic>` to a [ClassroomAcceptedAssignment].
  factory ClassroomAcceptedAssignment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ClassroomAcceptedAssignment',
      json,
      () => ClassroomAcceptedAssignment(
        id: json['id'] as int,
        submitted: json['submitted'] as bool,
        passing: json['passing'] as bool,
        commitCount: json['commit_count'] as int,
        grade: json['grade'] as String,
        students: (json['students'] as List)
            .map<SimpleClassroomUser>(
              (e) => SimpleClassroomUser.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        repository: SimpleClassroomRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
        assignment: SimpleClassroomAssignment.fromJson(
          json['assignment'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ClassroomAcceptedAssignment? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ClassroomAcceptedAssignment.fromJson(json);
  }

  /// Unique identifier of the repository.
  /// Example: `42`
  final int id;

  /// Whether an accepted assignment has been submitted.
  /// Example: `true`
  final bool submitted;

  /// Whether a submission passed.
  /// Example: `true`
  final bool passing;

  /// Count of student commits.
  /// Example: `5`
  final int commitCount;

  /// Most recent grade.
  /// Example: `'10/10'`
  final String grade;
  final List<SimpleClassroomUser> students;

  /// Simple Classroom Repository
  /// A GitHub repository view for Classroom
  final SimpleClassroomRepository repository;

  /// Simple Classroom Assignment
  /// A GitHub Classroom assignment
  final SimpleClassroomAssignment assignment;

  /// Converts a [ClassroomAcceptedAssignment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'submitted': submitted,
      'passing': passing,
      'commit_count': commitCount,
      'grade': grade,
      'students': students.map((e) => e.toJson()).toList(),
      'repository': repository.toJson(),
      'assignment': assignment.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    submitted,
    passing,
    commitCount,
    grade,
    listHash(students),
    repository,
    assignment,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ClassroomAcceptedAssignment &&
        id == other.id &&
        submitted == other.submitted &&
        passing == other.passing &&
        commitCount == other.commitCount &&
        grade == other.grade &&
        listsEqual(students, other.students) &&
        repository == other.repository &&
        assignment == other.assignment;
  }
}
