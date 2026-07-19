// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityUpdateConfigurationRequestDependencyGraph', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          CodeSecurityUpdateConfigurationRequestDependencyGraph.enabled;
      final parsed =
          CodeSecurityUpdateConfigurationRequestDependencyGraph.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecurityUpdateConfigurationRequestDependencyGraph.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CodeSecurityUpdateConfigurationRequestDependencyGraph.maybeFromJson(
              '__invalid_enum_value__',
            ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in CodeSecurityUpdateConfigurationRequestDependencyGraph.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in CodeSecurityUpdateConfigurationRequestDependencyGraph.values) {
        expect(
          CodeSecurityUpdateConfigurationRequestDependencyGraph.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
