// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('EmbeddedActivityLocationKind', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EmbeddedActivityLocationKind.guildChannel;
      final parsed = EmbeddedActivityLocationKind.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EmbeddedActivityLocationKind.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EmbeddedActivityLocationKind.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in EmbeddedActivityLocationKind.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in EmbeddedActivityLocationKind.values) {
        expect(
          EmbeddedActivityLocationKind.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
