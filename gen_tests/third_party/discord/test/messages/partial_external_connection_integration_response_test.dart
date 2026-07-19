// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('PartialExternalConnectionIntegrationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PartialExternalConnectionIntegrationResponse(
        id: SnowflakeType('0'),
        type: IntegrationTypes.discord,
        name: 'example',
        account: const AccountResponse(id: 'example', name: 'example'),
      );
      final parsed = PartialExternalConnectionIntegrationResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PartialExternalConnectionIntegrationResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PartialExternalConnectionIntegrationResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
