// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageRoleSubscriptionDataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageRoleSubscriptionDataResponse(
        roleSubscriptionListingId: SnowflakeType('0'),
        tierName: 'example',
        totalMonthsSubscribed: 0,
        isRenewal: false,
      );
      final parsed = MessageRoleSubscriptionDataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageRoleSubscriptionDataResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageRoleSubscriptionDataResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
