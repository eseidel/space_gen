// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateOrUpdateFileContentsRequestAuthor', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateOrUpdateFileContentsRequestAuthor(
        name: 'example',
        email: 'example',
      );
      final parsed = ReposCreateOrUpdateFileContentsRequestAuthor.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposCreateOrUpdateFileContentsRequestAuthor.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateOrUpdateFileContentsRequestAuthor.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
