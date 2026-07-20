// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleMaxFilePathLengthParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RepositoryRuleMaxFilePathLengthParameters(
        maxFilePathLength: 1,
      );
      final parsed = RepositoryRuleMaxFilePathLengthParameters.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleMaxFilePathLengthParameters.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleMaxFilePathLengthParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
