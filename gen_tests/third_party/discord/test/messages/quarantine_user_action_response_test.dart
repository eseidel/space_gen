// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('QuarantineUserActionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = QuarantineUserActionResponse(
        metadata: QuarantineUserActionMetadataResponse(),
      );
      final parsed = QuarantineUserActionResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(QuarantineUserActionResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => QuarantineUserActionResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
