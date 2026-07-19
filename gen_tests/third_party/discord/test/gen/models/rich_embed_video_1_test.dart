// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RichEmbedVideo1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RichEmbedVideo1();
      final parsed = RichEmbedVideo1.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RichEmbedVideo1.maybeFromJson(null), isNull);
    });
  });
}
