// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReleaseNotesContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReleaseNotesContent(
        name: 'Release v1.0.0 is now available!',
        body: 'example',
      );
      final parsed = ReleaseNotesContent.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReleaseNotesContent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReleaseNotesContent.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
