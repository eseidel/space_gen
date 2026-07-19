// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PorterAuthor', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PorterAuthor(
        id: 0,
        remoteId: 'example',
        remoteName: 'example',
        email: 'example',
        name: 'example',
        url: Uri.parse('https://example.com'),
        importUrl: Uri.parse('https://example.com'),
      );
      final parsed = PorterAuthor.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PorterAuthor.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PorterAuthor.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
