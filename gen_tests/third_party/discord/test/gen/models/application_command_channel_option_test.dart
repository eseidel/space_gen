// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandChannelOption', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationCommandChannelOption(
        name: 'example',
        description: 'example',
      );
      final parsed = ApplicationCommandChannelOption.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandChannelOption.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ApplicationCommandChannelOption.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
