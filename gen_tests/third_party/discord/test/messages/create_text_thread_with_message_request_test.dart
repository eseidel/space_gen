// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateTextThreadWithMessageRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CreateTextThreadWithMessageRequest(name: 'example');
      final parsed = CreateTextThreadWithMessageRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateTextThreadWithMessageRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateTextThreadWithMessageRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
