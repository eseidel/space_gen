// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandOptionNumberChoice', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandOptionNumberChoice(
        name: 'example',
        value: 0,
      );
      final parsed = ApplicationCommandOptionNumberChoice.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandOptionNumberChoice.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandOptionNumberChoice.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
