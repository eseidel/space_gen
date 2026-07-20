// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityUpdateConfigurationRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeSecurityUpdateConfigurationRequest();
      final parsed = CodeSecurityUpdateConfigurationRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecurityUpdateConfigurationRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
