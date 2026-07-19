// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRulesetBypassActor', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRulesetBypassActor(
        actorType: RepositoryRulesetBypassActorActorType.integration,
      );
      final parsed = RepositoryRulesetBypassActor.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRulesetBypassActor.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRulesetBypassActor.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
