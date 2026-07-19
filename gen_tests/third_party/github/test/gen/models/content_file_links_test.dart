// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ContentFileLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ContentFileLinks(
        git: Uri.parse('https://example.com'),
        html: Uri.parse('https://example.com'),
        self: Uri.parse('https://example.com'),
      );
      final parsed = ContentFileLinks.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ContentFileLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ContentFileLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
