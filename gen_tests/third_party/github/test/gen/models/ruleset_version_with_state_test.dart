// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RulesetVersionWithState', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RulesetVersionWithState(
        versionId: 0,
        actor: const RulesetVersionActor(),
        updatedAt: DateTime.utc(2024),
        state: const <String, dynamic>{},
      );
      final parsed = RulesetVersionWithState.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RulesetVersionWithState.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RulesetVersionWithState.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
