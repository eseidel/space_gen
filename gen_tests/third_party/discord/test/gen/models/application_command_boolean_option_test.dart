// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandBooleanOption', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandBooleanOption(
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandBooleanOption.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandBooleanOption.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ApplicationCommandBooleanOption.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
