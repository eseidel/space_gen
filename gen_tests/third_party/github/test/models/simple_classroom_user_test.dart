// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleClassroomUser', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SimpleClassroomUser(
        id: 1,
        login: 'octocat',
        avatarUrl: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
      );
      final parsed = SimpleClassroomUser.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SimpleClassroomUser.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SimpleClassroomUser.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
