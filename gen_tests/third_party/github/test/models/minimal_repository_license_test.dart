// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MinimalRepositoryLicense', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MinimalRepositoryLicense();
      final parsed = MinimalRepositoryLicense.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MinimalRepositoryLicense.maybeFromJson(null), isNull);
    });
  });
}
