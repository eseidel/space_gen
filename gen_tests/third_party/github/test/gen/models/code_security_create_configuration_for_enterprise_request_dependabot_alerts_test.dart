// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityCreateConfigurationForEnterpriseRequestDependabotAlerts', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          CodeSecurityCreateConfigurationForEnterpriseRequestDependabotAlerts
              .enabled;
      final parsed =
          CodeSecurityCreateConfigurationForEnterpriseRequestDependabotAlerts.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecurityCreateConfigurationForEnterpriseRequestDependabotAlerts.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CodeSecurityCreateConfigurationForEnterpriseRequestDependabotAlerts.maybeFromJson(
              '__invalid_enum_value__',
            ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in CodeSecurityCreateConfigurationForEnterpriseRequestDependabotAlerts
              .values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in CodeSecurityCreateConfigurationForEnterpriseRequestDependabotAlerts
              .values) {
        expect(
          CodeSecurityCreateConfigurationForEnterpriseRequestDependabotAlerts.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
