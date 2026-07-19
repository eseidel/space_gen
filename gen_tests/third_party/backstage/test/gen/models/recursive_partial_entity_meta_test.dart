// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('RecursivePartialEntityMeta', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RecursivePartialEntityMeta(entries: <String, dynamic>{});
      final parsed = RecursivePartialEntityMeta.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RecursivePartialEntityMeta.maybeFromJson(null), isNull);
    });
  });
}
