// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateOrgRulesetRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateOrgRulesetRequest();
      final parsed = ReposUpdateOrgRulesetRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposUpdateOrgRulesetRequest.maybeFromJson(null), isNull);
    });
  });
}
