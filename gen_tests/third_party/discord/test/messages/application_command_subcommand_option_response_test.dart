// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandSubcommandOptionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandSubcommandOptionResponse(
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandSubcommandOptionResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ApplicationCommandSubcommandOptionResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandSubcommandOptionResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
