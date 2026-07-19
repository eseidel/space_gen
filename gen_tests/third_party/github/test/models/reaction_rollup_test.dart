// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionRollup', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ReactionRollup(
        url: Uri.parse('https://example.com'),
        totalCount: 0,
        plus1: 0,
        minus1: 0,
        laugh: 0,
        confused: 0,
        heart: 0,
        hooray: 0,
        eyes: 0,
        rocket: 0,
      );
      final parsed = ReactionRollup.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReactionRollup.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionRollup.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
