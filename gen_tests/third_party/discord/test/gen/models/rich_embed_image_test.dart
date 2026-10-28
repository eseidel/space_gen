// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RichEmbedImage', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RichEmbedImage();
      final parsed = RichEmbedImage.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RichEmbedImage.maybeFromJson(null), isNull);
    });
  });
}
