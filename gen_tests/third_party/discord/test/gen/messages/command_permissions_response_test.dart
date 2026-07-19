// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommandPermissionsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CommandPermissionsResponse(
        id: SnowflakeType('0'),
        applicationId: SnowflakeType('0'),
        guildId: SnowflakeType('0'),
        permissions: <CommandPermissionResponse>[
          CommandPermissionResponse(
            id: SnowflakeType('0'),
            type: ApplicationCommandPermissionType.role,
            permission: false,
          ),
        ],
      );
      final parsed = CommandPermissionsResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommandPermissionsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CommandPermissionsResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
