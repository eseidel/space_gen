// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationExplicitContentFilterTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationExplicitContentFilterTypes.inherit;
      final parsed = ApplicationExplicitContentFilterTypes.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationExplicitContentFilterTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationExplicitContentFilterTypes.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ApplicationExplicitContentFilterTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ApplicationExplicitContentFilterTypes.values) {
        expect(
          ApplicationExplicitContentFilterTypes.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
