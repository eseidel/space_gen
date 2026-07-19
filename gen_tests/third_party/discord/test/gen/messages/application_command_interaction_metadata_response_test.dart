// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandInteractionMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandInteractionMetadataResponse(
        id: SnowflakeType('0'),
        authorizingIntegrationOwners: {'key': SnowflakeType('0')},
      );
      final parsed =
          ApplicationCommandInteractionMetadataResponse.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ApplicationCommandInteractionMetadataResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandInteractionMetadataResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
