// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AllowedMentionTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AllowedMentionTypes.users;
      final parsed = AllowedMentionTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AllowedMentionTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AllowedMentionTypes.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AllowedMentionTypes.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AllowedMentionTypes.values) {
        expect(AllowedMentionTypes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
