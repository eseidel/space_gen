// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependencyGraphSpdxSbomSbomCreationInfo', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependencyGraphSpdxSbomSbomCreationInfo(
        created: '2021-11-03T00:00:00Z',
        creators: <String>['GitHub'],
      );
      final parsed = DependencyGraphSpdxSbomSbomCreationInfo.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependencyGraphSpdxSbomSbomCreationInfo.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependencyGraphSpdxSbomSbomCreationInfo.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
