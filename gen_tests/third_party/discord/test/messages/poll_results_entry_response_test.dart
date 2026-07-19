// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PollResultsEntryResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PollResultsEntryResponse(
        id: 0,
        count: 0,
        meVoted: false,
      );
      final parsed = PollResultsEntryResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PollResultsEntryResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PollResultsEntryResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
