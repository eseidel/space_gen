// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('BranchProtection', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BranchProtection();
      final parsed = BranchProtection.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BranchProtection.maybeFromJson(null), isNull);
    });
  });
}
