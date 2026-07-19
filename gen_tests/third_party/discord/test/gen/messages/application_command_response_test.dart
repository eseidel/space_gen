// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandResponse(
        id: SnowflakeType('0'),
        applicationId: SnowflakeType('0'),
        version: SnowflakeType('0'),
        defaultMemberPermissions: 'example',
        type: ApplicationCommandType.chat,
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
