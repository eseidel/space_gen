// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandNumberOption', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandNumberOption(
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandNumberOption.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandNumberOption.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandNumberOption.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
