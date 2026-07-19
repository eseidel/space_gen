// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationResponse(
        id: SnowflakeType('0'),
        name: 'example',
        icon: 'example',
        description: 'example',
        type: ApplicationTypes.guildRoleSubscriptions,
        verifyKey: 'example',
        flags: 0,
      );
      final parsed = ApplicationResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
