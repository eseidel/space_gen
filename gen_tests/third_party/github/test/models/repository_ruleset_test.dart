// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleset', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleset(
        id: 0,
        name: 'example',
        source: 'example',
        enforcement: RepositoryRuleEnforcement.disabled,
      );
      final parsed = RepositoryRuleset.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRuleset.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleset.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
