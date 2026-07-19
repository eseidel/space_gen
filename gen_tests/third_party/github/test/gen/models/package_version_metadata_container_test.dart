// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PackageVersionMetadataContainer', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PackageVersionMetadataContainer(
        tags: <String>['example'],
      );
      final parsed = PackageVersionMetadataContainer.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PackageVersionMetadataContainer.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            PackageVersionMetadataContainer.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
