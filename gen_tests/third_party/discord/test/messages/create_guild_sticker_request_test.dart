// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateGuildStickerRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CreateGuildStickerRequest(
        name: 'example',
        tags: 'example',
        file: 'example',
      );
      final parsed = CreateGuildStickerRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateGuildStickerRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateGuildStickerRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
