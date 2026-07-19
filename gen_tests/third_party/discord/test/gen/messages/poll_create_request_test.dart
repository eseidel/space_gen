// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PollCreateRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PollCreateRequest(
        question: PollMedia(),
        answers: <PollAnswerCreateRequest>[
          PollAnswerCreateRequest(pollMedia: PollMediaCreateRequest()),
        ],
      );
      final parsed = PollCreateRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PollCreateRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PollCreateRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
