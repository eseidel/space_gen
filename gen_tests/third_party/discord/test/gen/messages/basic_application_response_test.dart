// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BasicApplicationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BasicApplicationResponse(
        id: SnowflakeType('0'),
        name: 'example',
        icon: 'example',
        description: 'example',
        type: ApplicationTypes.guildRoleSubscriptions,
      );
      final parsed = BasicApplicationResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BasicApplicationResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BasicApplicationResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
