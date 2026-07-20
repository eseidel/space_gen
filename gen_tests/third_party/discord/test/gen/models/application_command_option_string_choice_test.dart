// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandOptionStringChoice', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandOptionStringChoice(
        name: 'example',
        value: 'example',
      );
      final parsed = ApplicationCommandOptionStringChoice.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandOptionStringChoice.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandOptionStringChoice.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
