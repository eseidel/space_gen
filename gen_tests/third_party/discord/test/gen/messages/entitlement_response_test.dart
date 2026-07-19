// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntitlementResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = EntitlementResponse(
        id: SnowflakeType('0'),
        skuId: SnowflakeType('0'),
        applicationId: SnowflakeType('0'),
        userId: SnowflakeType('0'),
        deleted: false,
        startsAt: DateTime.utc(2024),
        endsAt: DateTime.utc(2024),
        type: EntitlementTypes.applicationSubscription,
      );
      final parsed = EntitlementResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntitlementResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EntitlementResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
