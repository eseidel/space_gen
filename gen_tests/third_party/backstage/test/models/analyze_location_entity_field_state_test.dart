// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('AnalyzeLocationEntityFieldState', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AnalyzeLocationEntityFieldState.analysisSuggestedValue;
      final parsed = AnalyzeLocationEntityFieldState.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AnalyzeLocationEntityFieldState.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AnalyzeLocationEntityFieldState.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AnalyzeLocationEntityFieldState.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AnalyzeLocationEntityFieldState.values) {
        expect(
          AnalyzeLocationEntityFieldState.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
