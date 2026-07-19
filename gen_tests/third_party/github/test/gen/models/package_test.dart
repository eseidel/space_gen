// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Package', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Package(
        id: 1,
        name: 'super-linter',
        packageType: PackagePackageType.npm,
        url:
            'https://api.github.com/orgs/github/packages/container/super-linter',
        htmlUrl:
            'https://github.com/orgs/github/packages/container/package/super-linter',
        versionCount: 1,
        visibility: PackageVisibility.private,
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
      );
      final parsed = Package.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Package.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Package.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
