// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RichEmbedThumbnail', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RichEmbedThumbnail();
      final parsed = RichEmbedThumbnail.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RichEmbedThumbnail.maybeFromJson(null), isNull);
    });
  });
}
