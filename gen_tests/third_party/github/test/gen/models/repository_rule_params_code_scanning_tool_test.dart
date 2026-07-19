// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleParamsCodeScanningTool', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleParamsCodeScanningTool(
        alertsThreshold:
            RepositoryRuleParamsCodeScanningToolAlertsThreshold.none,
        securityAlertsThreshold:
            RepositoryRuleParamsCodeScanningToolSecurityAlertsThreshold.none,
        tool: 'example',
      );
      final parsed = RepositoryRuleParamsCodeScanningTool.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRuleParamsCodeScanningTool.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleParamsCodeScanningTool.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
