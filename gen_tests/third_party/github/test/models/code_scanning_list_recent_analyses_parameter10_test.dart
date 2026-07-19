// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningListRecentAnalysesParameter10', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningListRecentAnalysesParameter10.created;
      final parsed = CodeScanningListRecentAnalysesParameter10.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningListRecentAnalysesParameter10.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningListRecentAnalysesParameter10.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CodeScanningListRecentAnalysesParameter10.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CodeScanningListRecentAnalysesParameter10.values) {
        expect(
          CodeScanningListRecentAnalysesParameter10.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
