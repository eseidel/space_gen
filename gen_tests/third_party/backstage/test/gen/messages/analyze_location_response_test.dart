// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('AnalyzeLocationResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AnalyzeLocationResponse(
        generateEntities: <AnalyzeLocationGenerateEntity>[
          AnalyzeLocationGenerateEntity(
            fields: <AnalyzeLocationEntityField>[
              AnalyzeLocationEntityField(
                description: 'example',
                value: 'example',
                state: AnalyzeLocationEntityFieldState.analysisSuggestedValue,
                field: 'example',
              ),
            ],
            entity: RecursivePartialEntity(),
          ),
        ],
        existingEntityFiles: <AnalyzeLocationExistingEntity>[
          AnalyzeLocationExistingEntity(
            entity: Entity(
              metadata: EntityMeta(
                name: 'example',
                entries: <String, dynamic>{},
              ),
              kind: 'example',
              apiVersion: 'example',
            ),
            isRegistered: false,
            location: LocationSpec(target: 'example', type: 'example'),
          ),
        ],
      );
      final parsed = AnalyzeLocationResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AnalyzeLocationResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AnalyzeLocationResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
