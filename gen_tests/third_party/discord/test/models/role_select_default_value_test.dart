// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RoleSelectDefaultValue', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RoleSelectDefaultValue(id: SnowflakeType('0'));
      final parsed = RoleSelectDefaultValue.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RoleSelectDefaultValue.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RoleSelectDefaultValue.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
