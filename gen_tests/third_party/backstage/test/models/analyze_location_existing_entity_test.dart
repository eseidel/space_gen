// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('AnalyzeLocationExistingEntity', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AnalyzeLocationExistingEntity(
        entity: Entity(
          metadata: EntityMeta(name: 'example', entries: <String, dynamic>{}),
          kind: 'example',
          apiVersion: 'example',
        ),
        isRegistered: false,
        location: LocationSpec(target: 'example', type: 'example'),
      );
      final parsed = AnalyzeLocationExistingEntity.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AnalyzeLocationExistingEntity.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AnalyzeLocationExistingEntity.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
