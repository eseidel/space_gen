// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationTypes.guildRoleSubscriptions;
      final parsed = ApplicationTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => ApplicationTypes.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in ApplicationTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ApplicationTypes.values) {
        expect(ApplicationTypes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
