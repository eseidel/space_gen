// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposGenerateReleaseNotesRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposGenerateReleaseNotesRequest(tagName: 'example');
      final parsed = ReposGenerateReleaseNotesRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposGenerateReleaseNotesRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ReposGenerateReleaseNotesRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
