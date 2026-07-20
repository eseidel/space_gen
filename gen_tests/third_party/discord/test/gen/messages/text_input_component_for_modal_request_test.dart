// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('TextInputComponentForModalRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TextInputComponentForModalRequest(
        customId: 'example',
        style: TextInputStyleTypes.short,
      );
      final parsed = TextInputComponentForModalRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TextInputComponentForModalRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TextInputComponentForModalRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
