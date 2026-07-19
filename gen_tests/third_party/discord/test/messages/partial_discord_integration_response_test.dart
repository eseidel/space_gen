// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PartialDiscordIntegrationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PartialDiscordIntegrationResponse(
        id: SnowflakeType('0'),
        name: 'example',
        account: const AccountResponse(id: 'example', name: 'example'),
        applicationId: SnowflakeType('0'),
      );
      final parsed = PartialDiscordIntegrationResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PartialDiscordIntegrationResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PartialDiscordIntegrationResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
