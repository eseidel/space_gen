// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RulesetVersionActor', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RulesetVersionActor();
      final parsed = RulesetVersionActor.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RulesetVersionActor.maybeFromJson(null), isNull);
    });
  });
}
