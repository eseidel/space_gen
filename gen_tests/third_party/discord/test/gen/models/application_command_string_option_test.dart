// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandStringOption', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandStringOption(
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandStringOption.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandStringOption.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandStringOption.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
