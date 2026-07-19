// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AppsListAccountsForPlanParameter2', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AppsListAccountsForPlanParameter2.asc;
      final parsed = AppsListAccountsForPlanParameter2.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AppsListAccountsForPlanParameter2.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AppsListAccountsForPlanParameter2.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AppsListAccountsForPlanParameter2.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AppsListAccountsForPlanParameter2.values) {
        expect(
          AppsListAccountsForPlanParameter2.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
