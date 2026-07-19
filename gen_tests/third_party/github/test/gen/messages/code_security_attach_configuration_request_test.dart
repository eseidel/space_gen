// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityAttachConfigurationRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeSecurityAttachConfigurationRequest(
        scope: CodeSecurityAttachConfigurationRequestScope.all,
      );
      final parsed = CodeSecurityAttachConfigurationRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecurityAttachConfigurationRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeSecurityAttachConfigurationRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
