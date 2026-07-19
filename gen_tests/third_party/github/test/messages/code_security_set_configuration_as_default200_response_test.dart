// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecuritySetConfigurationAsDefault200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeSecuritySetConfigurationAsDefault200Response();
      final parsed =
          CodeSecuritySetConfigurationAsDefault200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecuritySetConfigurationAsDefault200Response.maybeFromJson(null),
        isNull,
      );
    });
  });
}
