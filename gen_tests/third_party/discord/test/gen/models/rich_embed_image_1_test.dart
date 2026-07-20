// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RichEmbedImage1', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RichEmbedImage1();
      final parsed = RichEmbedImage1.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RichEmbedImage1.maybeFromJson(null), isNull);
    });
  });
}
