// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MinimalRepositoryPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MinimalRepositoryPermissions();
      final parsed = MinimalRepositoryPermissions.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MinimalRepositoryPermissions.maybeFromJson(null), isNull);
    });
  });
}
