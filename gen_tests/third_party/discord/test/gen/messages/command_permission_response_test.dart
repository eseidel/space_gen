// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommandPermissionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CommandPermissionResponse(
        id: SnowflakeType('0'),
        type: ApplicationCommandPermissionType.role,
        permission: false,
      );
      final parsed = CommandPermissionResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommandPermissionResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CommandPermissionResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
