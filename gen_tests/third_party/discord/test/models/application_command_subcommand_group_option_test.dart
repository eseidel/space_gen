// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandSubcommandGroupOption', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandSubcommandGroupOption(
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandSubcommandGroupOption.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ApplicationCommandSubcommandGroupOption.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandSubcommandGroupOption.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
