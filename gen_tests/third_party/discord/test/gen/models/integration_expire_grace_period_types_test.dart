// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('IntegrationExpireGracePeriodTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IntegrationExpireGracePeriodTypes.oneDay;
      final parsed = IntegrationExpireGracePeriodTypes.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IntegrationExpireGracePeriodTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IntegrationExpireGracePeriodTypes.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in IntegrationExpireGracePeriodTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in IntegrationExpireGracePeriodTypes.values) {
        expect(
          IntegrationExpireGracePeriodTypes.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
