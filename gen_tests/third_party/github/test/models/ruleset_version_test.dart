// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RulesetVersion', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RulesetVersion(
        versionId: 0,
        actor: const RulesetVersionActor(),
        updatedAt: DateTime.utc(2024),
      );
      final parsed = RulesetVersion.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RulesetVersion.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RulesetVersion.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
