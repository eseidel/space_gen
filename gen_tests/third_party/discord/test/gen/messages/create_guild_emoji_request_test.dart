// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateGuildEmojiRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreateGuildEmojiRequest(
        name: 'example',
        image: Uint8List.fromList(const <int>[0]),
      );
      final parsed = CreateGuildEmojiRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateGuildEmojiRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateGuildEmojiRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
