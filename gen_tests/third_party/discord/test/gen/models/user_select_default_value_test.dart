// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UserSelectDefaultValue', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UserSelectDefaultValue(id: SnowflakeType('0'));
      final parsed = UserSelectDefaultValue.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UserSelectDefaultValue.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UserSelectDefaultValue.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
