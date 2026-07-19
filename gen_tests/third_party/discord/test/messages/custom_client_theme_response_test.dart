// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CustomClientThemeResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CustomClientThemeResponse(
        colors: <String>['example'],
        gradientAngle: 0,
        baseMix: 0,
        baseTheme: MessageShareCustomUserThemeBaseTheme.unset,
      );
      final parsed = CustomClientThemeResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CustomClientThemeResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CustomClientThemeResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
