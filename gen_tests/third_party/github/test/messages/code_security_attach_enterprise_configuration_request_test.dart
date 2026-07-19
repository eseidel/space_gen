// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityAttachEnterpriseConfigurationRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeSecurityAttachEnterpriseConfigurationRequest(
        scope: CodeSecurityAttachEnterpriseConfigurationRequestScope.all,
      );
      final parsed =
          CodeSecurityAttachEnterpriseConfigurationRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecurityAttachEnterpriseConfigurationRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeSecurityAttachEnterpriseConfigurationRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
