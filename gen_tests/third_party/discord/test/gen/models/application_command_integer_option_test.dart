// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandIntegerOption', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandIntegerOption(
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandIntegerOption.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandIntegerOption.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ApplicationCommandIntegerOption.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
