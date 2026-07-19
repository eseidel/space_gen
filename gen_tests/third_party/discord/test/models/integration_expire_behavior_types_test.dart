// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('IntegrationExpireBehaviorTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IntegrationExpireBehaviorTypes.removeRole;
      final parsed = IntegrationExpireBehaviorTypes.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IntegrationExpireBehaviorTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IntegrationExpireBehaviorTypes.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in IntegrationExpireBehaviorTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in IntegrationExpireBehaviorTypes.values) {
        expect(
          IntegrationExpireBehaviorTypes.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
