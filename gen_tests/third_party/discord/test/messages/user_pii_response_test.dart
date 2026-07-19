// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UserPiiResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UserPiiResponse(
        id: SnowflakeType('0'),
        username: 'example',
        avatar: 'example',
        discriminator: 'example',
        publicFlags: 0,
        flags: Int53Type(-9007199254740991),
        globalName: 'example',
        mfaEnabled: false,
        locale: AvailableLocalesEnum.ar,
      );
      final parsed = UserPiiResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UserPiiResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UserPiiResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
