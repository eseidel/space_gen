// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('InviteTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = InviteTypes.guild;
      final parsed = InviteTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InviteTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => InviteTypes.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in InviteTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in InviteTypes.values) {
        expect(InviteTypes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
