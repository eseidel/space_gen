// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PollEmojiCreateRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PollEmojiCreateRequest();
      final parsed = PollEmojiCreateRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PollEmojiCreateRequest.maybeFromJson(null), isNull);
    });
  });
}
