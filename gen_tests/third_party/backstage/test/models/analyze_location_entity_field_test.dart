// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('AnalyzeLocationEntityField', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AnalyzeLocationEntityField(
        description: 'example',
        value: 'example',
        state: AnalyzeLocationEntityFieldState.analysisSuggestedValue,
        field: 'example',
      );
      final parsed = AnalyzeLocationEntityField.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AnalyzeLocationEntityField.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AnalyzeLocationEntityField.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
