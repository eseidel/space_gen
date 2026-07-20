// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RichEmbedFooter1', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RichEmbedFooter1();
      final parsed = RichEmbedFooter1.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RichEmbedFooter1.maybeFromJson(null), isNull);
    });
  });
}
