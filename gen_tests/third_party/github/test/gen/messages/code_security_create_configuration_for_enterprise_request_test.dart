// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityCreateConfigurationForEnterpriseRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeSecurityCreateConfigurationForEnterpriseRequest(
        name: 'example',
        description: 'example',
      );
      final parsed =
          CodeSecurityCreateConfigurationForEnterpriseRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecurityCreateConfigurationForEnterpriseRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeSecurityCreateConfigurationForEnterpriseRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
