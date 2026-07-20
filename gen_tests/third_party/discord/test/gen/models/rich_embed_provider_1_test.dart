// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RichEmbedProvider1', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RichEmbedProvider1();
      final parsed = RichEmbedProvider1.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RichEmbedProvider1.maybeFromJson(null), isNull);
    });
  });
}
