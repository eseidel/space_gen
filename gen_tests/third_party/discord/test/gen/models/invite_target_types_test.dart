// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('InviteTargetTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = InviteTargetTypes.stream;
      final parsed = InviteTargetTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InviteTargetTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => InviteTargetTypes.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in InviteTargetTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in InviteTargetTypes.values) {
        expect(InviteTargetTypes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
