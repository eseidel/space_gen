// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateApplicationEmojiRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UpdateApplicationEmojiRequest();
      final parsed = UpdateApplicationEmojiRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateApplicationEmojiRequest.maybeFromJson(null), isNull);
    });
  });
}
