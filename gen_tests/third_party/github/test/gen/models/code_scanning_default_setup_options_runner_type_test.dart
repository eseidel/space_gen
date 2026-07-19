// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningDefaultSetupOptionsRunnerType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningDefaultSetupOptionsRunnerType.standard;
      final parsed = CodeScanningDefaultSetupOptionsRunnerType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningDefaultSetupOptionsRunnerType.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningDefaultSetupOptionsRunnerType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CodeScanningDefaultSetupOptionsRunnerType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CodeScanningDefaultSetupOptionsRunnerType.values) {
        expect(
          CodeScanningDefaultSetupOptionsRunnerType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
