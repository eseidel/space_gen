// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityAttachEnterpriseConfigurationRequestScope', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          CodeSecurityAttachEnterpriseConfigurationRequestScope.all;
      final parsed =
          CodeSecurityAttachEnterpriseConfigurationRequestScope.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecurityAttachEnterpriseConfigurationRequestScope.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CodeSecurityAttachEnterpriseConfigurationRequestScope.maybeFromJson(
              '__invalid_enum_value__',
            ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in CodeSecurityAttachEnterpriseConfigurationRequestScope.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in CodeSecurityAttachEnterpriseConfigurationRequestScope.values) {
        expect(
          CodeSecurityAttachEnterpriseConfigurationRequestScope.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
