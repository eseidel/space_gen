// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandChannelOptionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandChannelOptionResponse(
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandChannelOptionResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ApplicationCommandChannelOptionResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationCommandChannelOptionResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
