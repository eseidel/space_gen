// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateApplicationEmojiRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreateApplicationEmojiRequest(
        name: 'example',
        image: Uint8List.fromList(const <int>[0]),
      );
      final parsed = CreateApplicationEmojiRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateApplicationEmojiRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateApplicationEmojiRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
