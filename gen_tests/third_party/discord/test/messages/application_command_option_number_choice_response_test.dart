// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandOptionNumberChoiceResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandOptionNumberChoiceResponse(
        name: 'example',
        value: 0,
      );
      final parsed = ApplicationCommandOptionNumberChoiceResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ApplicationCommandOptionNumberChoiceResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandOptionNumberChoiceResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
