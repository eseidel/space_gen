// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('AnalyzeLocationGenerateEntity', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AnalyzeLocationGenerateEntity(
        fields: <AnalyzeLocationEntityField>[
          AnalyzeLocationEntityField(
            description: 'example',
            value: 'example',
            state: AnalyzeLocationEntityFieldState.analysisSuggestedValue,
            field: 'example',
          ),
        ],
        entity: RecursivePartialEntity(),
      );
      final parsed = AnalyzeLocationGenerateEntity.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AnalyzeLocationGenerateEntity.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AnalyzeLocationGenerateEntity.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
