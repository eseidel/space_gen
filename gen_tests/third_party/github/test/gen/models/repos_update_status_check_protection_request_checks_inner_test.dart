// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateStatusCheckProtectionRequestChecksInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateStatusCheckProtectionRequestChecksInner(
        context: 'example',
      );
      final parsed =
          ReposUpdateStatusCheckProtectionRequestChecksInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposUpdateStatusCheckProtectionRequestChecksInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposUpdateStatusCheckProtectionRequestChecksInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
