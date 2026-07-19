// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningDefaultSetupUpdateThreatModel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningDefaultSetupUpdateThreatModel.remote;
      final parsed = CodeScanningDefaultSetupUpdateThreatModel.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningDefaultSetupUpdateThreatModel.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningDefaultSetupUpdateThreatModel.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CodeScanningDefaultSetupUpdateThreatModel.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CodeScanningDefaultSetupUpdateThreatModel.values) {
        expect(
          CodeScanningDefaultSetupUpdateThreatModel.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
