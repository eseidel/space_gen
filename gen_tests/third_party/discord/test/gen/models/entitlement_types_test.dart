// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntitlementTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntitlementTypes.applicationSubscription;
      final parsed = EntitlementTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntitlementTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => EntitlementTypes.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in EntitlementTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in EntitlementTypes.values) {
        expect(EntitlementTypes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
