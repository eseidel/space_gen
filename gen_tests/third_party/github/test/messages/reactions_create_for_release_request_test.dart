// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForReleaseRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForReleaseRequest(
        content: ReactionsCreateForReleaseRequestContent.plus1,
      );
      final parsed = ReactionsCreateForReleaseRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReactionsCreateForReleaseRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ReactionsCreateForReleaseRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
