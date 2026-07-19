// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ClassroomAssignment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ClassroomAssignment(
        id: 42,
        publicRepo: false,
        title: 'Intro to Binaries',
        type: ClassroomAssignmentType.individual,
        inviteLink: 'https://classroom.github.com/a/Lx7jiUgx',
        invitationsEnabled: false,
        slug: 'intro-to-binaries',
        studentsAreRepoAdmins: false,
        feedbackPullRequestsEnabled: false,
        maxTeams: 0,
        maxMembers: 0,
        editor: 'codespaces',
        accepted: 25,
        submitted: 10,
        passing: 10,
        language: 'elixir',
        deadline: DateTime.utc(2024),
        starterCodeRepository: SimpleClassroomRepository(
          id: 1296269,
          fullName: 'octocat/Hello-World',
          htmlUrl: Uri.parse('https://example.com'),
          nodeId: 'MDEwOlJlcG9zaXRvcnkxMjk2MjY5',
          private: false,
          defaultBranch: 'main',
        ),
        classroom: Classroom(
          id: 42,
          name: 'Programming Elixir',
          archived: false,
          organization: SimpleClassroomOrganization(
            id: 1,
            login: 'github',
            nodeId: 'MDEyOk9yZ2FuaXphdGlvbjE=',
            htmlUrl: Uri.parse('https://example.com'),
            name: 'Github - Code thigns happen here',
            avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
          ),
          url: 'https://classroom.github.com/classrooms/1-programming-elixir',
        ),
      );
      final parsed = ClassroomAssignment.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ClassroomAssignment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ClassroomAssignment.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
