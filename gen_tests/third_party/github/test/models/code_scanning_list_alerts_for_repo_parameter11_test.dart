// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningListAlertsForRepoParameter11', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningListAlertsForRepoParameter11.created;
      final parsed = CodeScanningListAlertsForRepoParameter11.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningListAlertsForRepoParameter11.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningListAlertsForRepoParameter11.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CodeScanningListAlertsForRepoParameter11.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CodeScanningListAlertsForRepoParameter11.values) {
        expect(
          CodeScanningListAlertsForRepoParameter11.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
