// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('RecursivePartialEntity', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RecursivePartialEntity();
      final parsed = RecursivePartialEntity.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RecursivePartialEntity.maybeFromJson(null), isNull);
    });
  });
}
