// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandUserOption', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandUserOption(
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandUserOption.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandUserOption.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandUserOption.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
