// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ClassroomAcceptedAssignment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ClassroomAcceptedAssignment(
        id: 42,
        submitted: false,
        passing: false,
        commitCount: 5,
        grade: '10/10',
        students: <SimpleClassroomUser>[
          SimpleClassroomUser(
            id: 1,
            login: 'octocat',
            avatarUrl: Uri.parse('https://example.com'),
            htmlUrl: Uri.parse('https://example.com'),
          ),
        ],
        repository: SimpleClassroomRepository(
          id: 1296269,
          fullName: 'octocat/Hello-World',
          htmlUrl: Uri.parse('https://example.com'),
          nodeId: 'MDEwOlJlcG9zaXRvcnkxMjk2MjY5',
          private: false,
          defaultBranch: 'main',
        ),
        assignment: SimpleClassroomAssignment(
          id: 42,
          publicRepo: false,
          title: 'Intro to Binaries',
          type: SimpleClassroomAssignmentType.individual,
          inviteLink: 'https://classroom.github.com/a/Lx7jiUgx',
          invitationsEnabled: false,
          slug: 'intro-to-binaries',
          studentsAreRepoAdmins: false,
          feedbackPullRequestsEnabled: false,
          editor: 'codespaces',
          accepted: 25,
          submitted: 10,
          passing: 10,
          language: 'elixir',
          deadline: DateTime.utc(2024),
          classroom: const SimpleClassroom(
            id: 42,
            name: 'Programming Elixir',
            archived: false,
            url: 'https://classroom.github.com/classrooms/1-programming-elixir',
          ),
        ),
      );
      final parsed = ClassroomAcceptedAssignment.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ClassroomAcceptedAssignment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ClassroomAcceptedAssignment.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
