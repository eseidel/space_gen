// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GistsCreateRequestPublicOneOf1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GistsCreateRequestPublicOneOf1.true_;
      final parsed = GistsCreateRequestPublicOneOf1.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GistsCreateRequestPublicOneOf1.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GistsCreateRequestPublicOneOf1.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in GistsCreateRequestPublicOneOf1.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in GistsCreateRequestPublicOneOf1.values) {
        expect(
          GistsCreateRequestPublicOneOf1.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
