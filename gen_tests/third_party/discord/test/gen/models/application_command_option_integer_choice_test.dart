// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandOptionIntegerChoice', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandOptionIntegerChoice(
        name: 'example',
        value: Int53Type(-9007199254740991),
      );
      final parsed = ApplicationCommandOptionIntegerChoice.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandOptionIntegerChoice.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandOptionIntegerChoice.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
