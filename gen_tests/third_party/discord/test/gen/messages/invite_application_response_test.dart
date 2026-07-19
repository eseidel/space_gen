// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('InviteApplicationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = InviteApplicationResponse(
        id: SnowflakeType('0'),
        name: 'example',
        icon: 'example',
        description: 'example',
        type: ApplicationTypes.guildRoleSubscriptions,
        verifyKey: 'example',
        flags: 0,
      );
      final parsed = InviteApplicationResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InviteApplicationResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InviteApplicationResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
