// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandOptionStringChoiceResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandOptionStringChoiceResponse(
        name: 'example',
        value: 'example',
      );
      final parsed = ApplicationCommandOptionStringChoiceResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ApplicationCommandOptionStringChoiceResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandOptionStringChoiceResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
