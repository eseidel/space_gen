// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityDefaultConfigurations', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeSecurityDefaultConfigurations(
        <CodeSecurityDefaultConfigurationsInner>[
          CodeSecurityDefaultConfigurationsInner(),
        ],
      );
      final parsed = CodeSecurityDefaultConfigurations.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed.toJson(), equals(instance.toJson()));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeSecurityDefaultConfigurations.maybeFromJson(null), isNull);
    });
  });
}
