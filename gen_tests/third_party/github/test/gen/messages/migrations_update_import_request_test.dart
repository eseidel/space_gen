// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MigrationsUpdateImportRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MigrationsUpdateImportRequest();
      final parsed = MigrationsUpdateImportRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MigrationsUpdateImportRequest.maybeFromJson(null), isNull);
    });
  });
}
