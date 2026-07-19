// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Blob', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Blob(
        content: 'example',
        encoding: 'example',
        url: Uri.parse('https://example.com'),
        sha: 'example',
        size: 0,
        nodeId: 'example',
      );
      final parsed = Blob.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Blob.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Blob.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
