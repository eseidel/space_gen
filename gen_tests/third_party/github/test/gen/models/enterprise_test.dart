// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Enterprise', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Enterprise(
        htmlUrl: Uri.parse('https://example.com'),
        id: 42,
        nodeId: 'MDEwOlJlcG9zaXRvcnkxMjk2MjY5',
        name: 'Octo Business',
        slug: 'octo-business',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        avatarUrl: Uri.parse('https://example.com'),
      );
      final parsed = Enterprise.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Enterprise.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Enterprise.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
