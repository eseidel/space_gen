// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleClassroomAssignment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SimpleClassroomAssignment(
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
      );
      final parsed = SimpleClassroomAssignment.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SimpleClassroomAssignment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SimpleClassroomAssignment.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
