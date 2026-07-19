// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleFilePathRestrictionParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleFilePathRestrictionParameters(
        restrictedFilePaths: <String>['example'],
      );
      final parsed = RepositoryRuleFilePathRestrictionParameters.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleFilePathRestrictionParameters.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleFilePathRestrictionParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
