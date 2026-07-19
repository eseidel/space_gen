// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleClassroomRepository', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SimpleClassroomRepository(
        id: 1296269,
        fullName: 'octocat/Hello-World',
        htmlUrl: Uri.parse('https://example.com'),
        nodeId: 'MDEwOlJlcG9zaXRvcnkxMjk2MjY5',
        private: false,
        defaultBranch: 'main',
      );
      final parsed = SimpleClassroomRepository.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SimpleClassroomRepository.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SimpleClassroomRepository.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
