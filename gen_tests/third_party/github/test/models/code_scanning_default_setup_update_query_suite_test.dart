// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningDefaultSetupUpdateQuerySuite', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningDefaultSetupUpdateQuerySuite.default_;
      final parsed = CodeScanningDefaultSetupUpdateQuerySuite.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningDefaultSetupUpdateQuerySuite.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningDefaultSetupUpdateQuerySuite.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CodeScanningDefaultSetupUpdateQuerySuite.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CodeScanningDefaultSetupUpdateQuerySuite.values) {
        expect(
          CodeScanningDefaultSetupUpdateQuerySuite.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
