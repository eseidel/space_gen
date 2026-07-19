// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ConnectedAccountIntegrationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ConnectedAccountIntegrationResponse(
        id: 'example',
        type: IntegrationTypes.discord,
        account: const AccountResponse(id: 'example', name: 'example'),
        guild: ConnectedAccountGuildResponse(
          id: SnowflakeType('0'),
          name: 'example',
          icon: 'example',
        ),
      );
      final parsed = ConnectedAccountIntegrationResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ConnectedAccountIntegrationResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ConnectedAccountIntegrationResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
