// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CustomClientThemeShareRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CustomClientThemeShareRequest(
        colors: const <String>['exampl'],
        gradientAngle: 0,
        baseMix: 0,
      );
      final parsed = CustomClientThemeShareRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CustomClientThemeShareRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CustomClientThemeShareRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
