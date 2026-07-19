// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandOptionIntegerChoiceResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandOptionIntegerChoiceResponse(
        name: 'example',
        value: Int53Type(-9007199254740991),
      );
      final parsed =
          ApplicationCommandOptionIntegerChoiceResponse.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ApplicationCommandOptionIntegerChoiceResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandOptionIntegerChoiceResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
