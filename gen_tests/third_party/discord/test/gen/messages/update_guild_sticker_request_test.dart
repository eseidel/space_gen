// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateGuildStickerRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UpdateGuildStickerRequest();
      final parsed = UpdateGuildStickerRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateGuildStickerRequest.maybeFromJson(null), isNull);
    });
  });
}
