// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandPermission', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandPermission(
        id: SnowflakeType('0'),
        type: ApplicationCommandPermissionType.role,
        permission: false,
      );
      final parsed = ApplicationCommandPermission.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandPermission.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandPermission.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
