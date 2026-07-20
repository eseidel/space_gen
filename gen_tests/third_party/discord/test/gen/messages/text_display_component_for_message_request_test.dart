// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('TextDisplayComponentForMessageRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TextDisplayComponentForMessageRequest(
        content: 'example',
      );
      final parsed = TextDisplayComponentForMessageRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TextDisplayComponentForMessageRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TextDisplayComponentForMessageRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
