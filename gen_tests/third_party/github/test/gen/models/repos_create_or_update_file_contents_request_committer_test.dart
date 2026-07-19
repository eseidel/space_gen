// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateOrUpdateFileContentsRequestCommitter', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateOrUpdateFileContentsRequestCommitter(
        name: 'example',
        email: 'example',
      );
      final parsed =
          ReposCreateOrUpdateFileContentsRequestCommitter.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposCreateOrUpdateFileContentsRequestCommitter.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateOrUpdateFileContentsRequestCommitter.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
