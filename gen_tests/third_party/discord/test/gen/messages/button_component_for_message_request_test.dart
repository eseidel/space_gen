// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ButtonComponentForMessageRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ButtonComponentForMessageRequest(
        style: ButtonStyleTypes.primary,
      );
      final parsed = ButtonComponentForMessageRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ButtonComponentForMessageRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ButtonComponentForMessageRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
