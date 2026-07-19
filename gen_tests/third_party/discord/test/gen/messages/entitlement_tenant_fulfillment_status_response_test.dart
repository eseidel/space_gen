// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntitlementTenantFulfillmentStatusResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntitlementTenantFulfillmentStatusResponse.unknown;
      final parsed = EntitlementTenantFulfillmentStatusResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        EntitlementTenantFulfillmentStatusResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntitlementTenantFulfillmentStatusResponse.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in EntitlementTenantFulfillmentStatusResponse.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in EntitlementTenantFulfillmentStatusResponse.values) {
        expect(
          EntitlementTenantFulfillmentStatusResponse.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
