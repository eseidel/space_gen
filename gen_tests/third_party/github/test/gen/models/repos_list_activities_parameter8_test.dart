// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposListActivitiesParameter8', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposListActivitiesParameter8.day;
      final parsed = ReposListActivitiesParameter8.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposListActivitiesParameter8.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposListActivitiesParameter8.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReposListActivitiesParameter8.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReposListActivitiesParameter8.values) {
        expect(
          ReposListActivitiesParameter8.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
