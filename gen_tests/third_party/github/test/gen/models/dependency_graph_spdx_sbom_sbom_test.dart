// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependencyGraphSpdxSbomSbom', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependencyGraphSpdxSbomSbom(
        spdxid: 'SPDXRef-DOCUMENT',
        spdxVersion: 'SPDX-2.3',
        creationInfo: DependencyGraphSpdxSbomSbomCreationInfo(
          created: '2021-11-03T00:00:00Z',
          creators: <String>['GitHub'],
        ),
        name: 'github/github',
        dataLicense: 'CC0-1.0',
        documentNamespace:
            'https://spdx.org/spdxdocs/protobom/15e41dd2-f961-4f4d-b8dc-f8f57ad70d57',
        packages: <DependencyGraphSpdxSbomSbomPackagesInner>[
          DependencyGraphSpdxSbomSbomPackagesInner(),
        ],
      );
      final parsed = DependencyGraphSpdxSbomSbom.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependencyGraphSpdxSbomSbom.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependencyGraphSpdxSbomSbom.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
