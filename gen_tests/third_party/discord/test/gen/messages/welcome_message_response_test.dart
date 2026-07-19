// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('WelcomeMessageResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = WelcomeMessageResponse(
        authorIds: <SnowflakeType>[SnowflakeType('0')],
        message: 'example',
      );
      final parsed = WelcomeMessageResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WelcomeMessageResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WelcomeMessageResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
