// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningListAlertsForOrgParameter9', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningListAlertsForOrgParameter9.created;
      final parsed = CodeScanningListAlertsForOrgParameter9.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningListAlertsForOrgParameter9.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningListAlertsForOrgParameter9.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CodeScanningListAlertsForOrgParameter9.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CodeScanningListAlertsForOrgParameter9.values) {
        expect(
          CodeScanningListAlertsForOrgParameter9.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
