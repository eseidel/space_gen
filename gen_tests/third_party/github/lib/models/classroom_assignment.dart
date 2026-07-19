import 'package:github/model_helpers.dart';
import 'package:github/models/classroom.dart';
import 'package:github/models/classroom_assignment_type.dart';
import 'package:github/models/simple_classroom_repository.dart';
import 'package:meta/meta.dart';

/// {@template classroom_assignment}
/// Classroom Assignment
/// A GitHub Classroom assignment
/// {@endtemplate}
@immutable
class ClassroomAssignment {
  /// {@macro classroom_assignment}
  const ClassroomAssignment({
    required this.id,
    required this.publicRepo,
    required this.title,
    required this.type,
    required this.inviteLink,
    required this.invitationsEnabled,
    required this.slug,
    required this.studentsAreRepoAdmins,
    required this.feedbackPullRequestsEnabled,
    required this.maxTeams,
    required this.maxMembers,
    required this.editor,
    required this.accepted,
    required this.submitted,
    required this.passing,
    required this.language,
    required this.deadline,
    required this.starterCodeRepository,
    required this.classroom,
  });

  /// Converts a `Map<String, dynamic>` to a [ClassroomAssignment].
  factory ClassroomAssignment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ClassroomAssignment',
      json,
      () => ClassroomAssignment(
        id: json['id'] as int,
        publicRepo: json['public_repo'] as bool,
        title: json['title'] as String,
        type: ClassroomAssignmentType.fromJson(json['type'] as String),
        inviteLink: json['invite_link'] as String,
        invitationsEnabled: json['invitations_enabled'] as bool,
        slug: json['slug'] as String,
        studentsAreRepoAdmins: json['students_are_repo_admins'] as bool,
        feedbackPullRequestsEnabled:
            json['feedback_pull_requests_enabled'] as bool,
        maxTeams: checkedKey(json, 'max_teams') as int?,
        maxMembers: checkedKey(json, 'max_members') as int?,
        editor: json['editor'] as String,
        accepted: json['accepted'] as int,
        submitted: json['submitted'] as int,
        passing: json['passing'] as int,
        language: json['language'] as String,
        deadline: maybeParseDateTime(checkedKey(json, 'deadline') as String?),
        starterCodeRepository: SimpleClassroomRepository.fromJson(
          json['starter_code_repository'] as Map<String, dynamic>,
        ),
        classroom: Classroom.fromJson(
          json['classroom'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ClassroomAssignment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ClassroomAssignment.fromJson(json);
  }

  /// Unique identifier of the repository.
  /// Example: `42`
  final int id;

  /// Whether an accepted assignment creates a public repository.
  /// Example: `true`
  final bool publicRepo;

  /// Assignment title.
  /// Example: `'Intro to Binaries'`
  final String title;

  /// Whether it's a group assignment or individual assignment.
  /// Example: `'individual'`
  final ClassroomAssignmentType type;

  /// The link that a student can use to accept the assignment.
  /// Example: `'https://classroom.github.com/a/Lx7jiUgx'`
  final String inviteLink;

  /// Whether the invitation link is enabled. Visiting an enabled invitation
  /// link will accept the assignment.
  /// Example: `true`
  final bool invitationsEnabled;

  /// Sluggified name of the assignment.
  /// Example: `'intro-to-binaries'`
  final String slug;

  /// Whether students are admins on created repository when a student accepts
  /// the assignment.
  /// Example: `true`
  final bool studentsAreRepoAdmins;

  /// Whether feedback pull request will be created when a student accepts the
  /// assignment.
  /// Example: `true`
  final bool feedbackPullRequestsEnabled;

  /// The maximum allowable teams for the assignment.
  /// Example: `0`
  final int? maxTeams;

  /// The maximum allowable members per team.
  /// Example: `0`
  final int? maxMembers;

  /// The selected editor for the assignment.
  /// Example: `'codespaces'`
  final String editor;

  /// The number of students that have accepted the assignment.
  /// Example: `25`
  final int accepted;

  /// The number of students that have submitted the assignment.
  /// Example: `10`
  final int submitted;

  /// The number of students that have passed the assignment.
  /// Example: `10`
  final int passing;

  /// The programming language used in the assignment.
  /// Example: `'elixir'`
  final String language;

  /// The time at which the assignment is due.
  /// Example: `'2011-01-26T19:06:43Z'`
  final DateTime? deadline;

  /// Simple Classroom Repository
  /// A GitHub repository view for Classroom
  final SimpleClassroomRepository starterCodeRepository;

  /// Classroom
  /// A GitHub Classroom classroom
  final Classroom classroom;

  /// Converts a [ClassroomAssignment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'public_repo': publicRepo,
      'title': title,
      'type': type.toJson(),
      'invite_link': inviteLink,
      'invitations_enabled': invitationsEnabled,
      'slug': slug,
      'students_are_repo_admins': studentsAreRepoAdmins,
      'feedback_pull_requests_enabled': feedbackPullRequestsEnabled,
      'max_teams': maxTeams,
      'max_members': maxMembers,
      'editor': editor,
      'accepted': accepted,
      'submitted': submitted,
      'passing': passing,
      'language': language,
      'deadline': deadline?.toIso8601String(),
      'starter_code_repository': starterCodeRepository.toJson(),
      'classroom': classroom.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    publicRepo,
    title,
    type,
    inviteLink,
    invitationsEnabled,
    slug,
    studentsAreRepoAdmins,
    feedbackPullRequestsEnabled,
    maxTeams,
    maxMembers,
    editor,
    accepted,
    submitted,
    passing,
    language,
    deadline,
    starterCodeRepository,
    classroom,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ClassroomAssignment &&
        id == other.id &&
        publicRepo == other.publicRepo &&
        title == other.title &&
        type == other.type &&
        inviteLink == other.inviteLink &&
        invitationsEnabled == other.invitationsEnabled &&
        slug == other.slug &&
        studentsAreRepoAdmins == other.studentsAreRepoAdmins &&
        feedbackPullRequestsEnabled == other.feedbackPullRequestsEnabled &&
        maxTeams == other.maxTeams &&
        maxMembers == other.maxMembers &&
        editor == other.editor &&
        accepted == other.accepted &&
        submitted == other.submitted &&
        passing == other.passing &&
        language == other.language &&
        deadline == other.deadline &&
        starterCodeRepository == other.starterCodeRepository &&
        classroom == other.classroom;
  }
}
