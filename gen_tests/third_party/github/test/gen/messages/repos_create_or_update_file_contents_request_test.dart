// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateOrUpdateFileContentsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateOrUpdateFileContentsRequest(
        message: 'example',
        content: 'example',
      );
      final parsed = ReposCreateOrUpdateFileContentsRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposCreateOrUpdateFileContentsRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateOrUpdateFileContentsRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
