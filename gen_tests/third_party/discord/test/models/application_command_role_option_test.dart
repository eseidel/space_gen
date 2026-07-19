// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandRoleOption', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandRoleOption(
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandRoleOption.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandRoleOption.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandRoleOption.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
