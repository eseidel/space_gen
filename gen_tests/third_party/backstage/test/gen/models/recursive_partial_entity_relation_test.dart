// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('RecursivePartialEntityRelation', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RecursivePartialEntityRelation();
      final parsed = RecursivePartialEntityRelation.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RecursivePartialEntityRelation.maybeFromJson(null), isNull);
    });
  });
}
