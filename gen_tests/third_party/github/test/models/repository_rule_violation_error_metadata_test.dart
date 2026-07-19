// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleViolationErrorMetadata', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleViolationErrorMetadata();
      final parsed = RepositoryRuleViolationErrorMetadata.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRuleViolationErrorMetadata.maybeFromJson(null), isNull);
    });
  });
}
