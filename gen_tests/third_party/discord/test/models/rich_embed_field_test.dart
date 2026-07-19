// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RichEmbedField', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RichEmbedField(name: 'example', value: 'example');
      final parsed = RichEmbedField.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RichEmbedField.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RichEmbedField.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
