// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAlertRuleSummarySecuritySeverityLevel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAlertRuleSummarySecuritySeverityLevel.low;
      final parsed =
          CodeScanningAlertRuleSummarySecuritySeverityLevel.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningAlertRuleSummarySecuritySeverityLevel.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningAlertRuleSummarySecuritySeverityLevel.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in CodeScanningAlertRuleSummarySecuritySeverityLevel.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in CodeScanningAlertRuleSummarySecuritySeverityLevel.values) {
        expect(
          CodeScanningAlertRuleSummarySecuritySeverityLevel.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
