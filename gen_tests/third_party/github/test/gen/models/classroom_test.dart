// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Classroom', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Classroom(
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
      );
      final parsed = Classroom.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Classroom.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Classroom.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
