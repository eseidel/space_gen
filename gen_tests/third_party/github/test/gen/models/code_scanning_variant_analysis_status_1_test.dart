// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningVariantAnalysisStatus1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningVariantAnalysisStatus1.inProgress;
      final parsed = CodeScanningVariantAnalysisStatus1.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningVariantAnalysisStatus1.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningVariantAnalysisStatus1.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CodeScanningVariantAnalysisStatus1.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CodeScanningVariantAnalysisStatus1.values) {
        expect(
          CodeScanningVariantAnalysisStatus1.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
