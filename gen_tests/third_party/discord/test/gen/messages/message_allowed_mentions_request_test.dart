// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageAllowedMentionsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageAllowedMentionsRequest();
      final parsed = MessageAllowedMentionsRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageAllowedMentionsRequest.maybeFromJson(null), isNull);
    });
  });
}
