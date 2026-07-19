// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleFileExtensionRestrictionParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleFileExtensionRestrictionParameters(
        restrictedFileExtensions: <String>['example'],
      );
      final parsed =
          RepositoryRuleFileExtensionRestrictionParameters.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleFileExtensionRestrictionParameters.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleFileExtensionRestrictionParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
