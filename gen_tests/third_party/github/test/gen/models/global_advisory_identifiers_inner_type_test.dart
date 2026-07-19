// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GlobalAdvisoryIdentifiersInnerType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GlobalAdvisoryIdentifiersInnerType.cve;
      final parsed = GlobalAdvisoryIdentifiersInnerType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GlobalAdvisoryIdentifiersInnerType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GlobalAdvisoryIdentifiersInnerType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in GlobalAdvisoryIdentifiersInnerType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in GlobalAdvisoryIdentifiersInnerType.values) {
        expect(
          GlobalAdvisoryIdentifiersInnerType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
