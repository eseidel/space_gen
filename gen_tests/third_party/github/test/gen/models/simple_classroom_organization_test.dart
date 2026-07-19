// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleClassroomOrganization', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SimpleClassroomOrganization(
        id: 1,
        login: 'github',
        nodeId: 'MDEyOk9yZ2FuaXphdGlvbjE=',
        htmlUrl: Uri.parse('https://example.com'),
        name: 'Github - Code thigns happen here',
        avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
      );
      final parsed = SimpleClassroomOrganization.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SimpleClassroomOrganization.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SimpleClassroomOrganization.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
