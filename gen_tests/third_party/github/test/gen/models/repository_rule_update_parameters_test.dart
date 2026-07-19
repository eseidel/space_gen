// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleUpdateParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleUpdateParameters(
        updateAllowsFetchAndMerge: false,
      );
      final parsed = RepositoryRuleUpdateParameters.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRuleUpdateParameters.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleUpdateParameters.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
