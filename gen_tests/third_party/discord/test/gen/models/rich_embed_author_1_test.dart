// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RichEmbedAuthor1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RichEmbedAuthor1();
      final parsed = RichEmbedAuthor1.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RichEmbedAuthor1.maybeFromJson(null), isNull);
    });
  });
}
