// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageShareCustomUserThemeBaseTheme', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MessageShareCustomUserThemeBaseTheme.unset;
      final parsed = MessageShareCustomUserThemeBaseTheme.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageShareCustomUserThemeBaseTheme.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageShareCustomUserThemeBaseTheme.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in MessageShareCustomUserThemeBaseTheme.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in MessageShareCustomUserThemeBaseTheme.values) {
        expect(
          MessageShareCustomUserThemeBaseTheme.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
