// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TimelineCommittedEventVerification', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TimelineCommittedEventVerification(
        verified: false,
        reason: 'example',
        signature: 'example',
        payload: 'example',
        verifiedAt: 'example',
      );
      final parsed = TimelineCommittedEventVerification.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TimelineCommittedEventVerification.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TimelineCommittedEventVerification.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
