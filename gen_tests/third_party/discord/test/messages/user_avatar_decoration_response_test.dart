// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UserAvatarDecorationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UserAvatarDecorationResponse(
        asset: 'example',
        skuId: SnowflakeType('0'),
      );
      final parsed = UserAvatarDecorationResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UserAvatarDecorationResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UserAvatarDecorationResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
