// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleCommitStatus', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SimpleCommitStatus(
        description: 'example',
        id: 0,
        nodeId: 'example',
        state: 'example',
        context: 'example',
        targetUrl: Uri.parse('https://example.com'),
        avatarUrl: Uri.parse('https://example.com'),
        url: Uri.parse('https://example.com'),
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
      );
      final parsed = SimpleCommitStatus.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SimpleCommitStatus.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SimpleCommitStatus.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
