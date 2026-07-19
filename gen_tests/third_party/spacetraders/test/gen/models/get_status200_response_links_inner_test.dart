// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetStatus200ResponseLinksInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetStatus200ResponseLinksInner(
        name: 'example',
        url: Uri.parse('https://example.com'),
      );
      final parsed = GetStatus200ResponseLinksInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetStatus200ResponseLinksInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetStatus200ResponseLinksInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
