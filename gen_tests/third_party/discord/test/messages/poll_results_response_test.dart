// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PollResultsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PollResultsResponse(
        answerCounts: <PollResultsEntryResponse>[
          PollResultsEntryResponse(id: 0, count: 0, meVoted: false),
        ],
        isFinalized: false,
      );
      final parsed = PollResultsResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PollResultsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PollResultsResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
