// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AppsListAccountsForPlanDirection', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AppsListAccountsForPlanDirection.asc;
      final parsed = AppsListAccountsForPlanDirection.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AppsListAccountsForPlanDirection.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AppsListAccountsForPlanDirection.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AppsListAccountsForPlanDirection.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AppsListAccountsForPlanDirection.values) {
        expect(
          AppsListAccountsForPlanDirection.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
