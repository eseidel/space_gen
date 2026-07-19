// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationIntegrationType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationIntegrationType.guildInstall;
      final parsed = ApplicationIntegrationType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationIntegrationType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationIntegrationType.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ApplicationIntegrationType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ApplicationIntegrationType.values) {
        expect(
          ApplicationIntegrationType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
