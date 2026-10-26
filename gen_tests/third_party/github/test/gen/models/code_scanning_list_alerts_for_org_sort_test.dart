// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningListAlertsForOrgSort', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningListAlertsForOrgSort.created;
      final parsed = CodeScanningListAlertsForOrgSort.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningListAlertsForOrgSort.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningListAlertsForOrgSort.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CodeScanningListAlertsForOrgSort.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CodeScanningListAlertsForOrgSort.values) {
        expect(
          CodeScanningListAlertsForOrgSort.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
