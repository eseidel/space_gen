// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PartialGuildSubscriptionIntegrationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PartialGuildSubscriptionIntegrationResponse(
        id: SnowflakeType('0'),
        name: 'example',
        account: const AccountResponse(id: 'example', name: 'example'),
      );
      final parsed = PartialGuildSubscriptionIntegrationResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PartialGuildSubscriptionIntegrationResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PartialGuildSubscriptionIntegrationResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
