// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAndAnalysisDependabotSecurityUpdates', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecurityAndAnalysisDependabotSecurityUpdates();
      final parsed = SecurityAndAnalysisDependabotSecurityUpdates.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecurityAndAnalysisDependabotSecurityUpdates.maybeFromJson(null),
        isNull,
      );
    });
  });
}
