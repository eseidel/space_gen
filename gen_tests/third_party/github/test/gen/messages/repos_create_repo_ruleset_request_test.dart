// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateRepoRulesetRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateRepoRulesetRequest(
        name: 'example',
        enforcement: RepositoryRuleEnforcement.disabled,
      );
      final parsed = ReposCreateRepoRulesetRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreateRepoRulesetRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateRepoRulesetRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
