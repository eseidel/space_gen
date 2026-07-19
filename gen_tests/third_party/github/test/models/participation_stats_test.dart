// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ParticipationStats', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ParticipationStats(all: <int>[0], owner: <int>[0]);
      final parsed = ParticipationStats.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ParticipationStats.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ParticipationStats.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
