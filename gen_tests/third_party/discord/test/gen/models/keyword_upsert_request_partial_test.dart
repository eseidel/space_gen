// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('KeywordUpsertRequestPartial', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = KeywordUpsertRequestPartial();
      final parsed = KeywordUpsertRequestPartial.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(KeywordUpsertRequestPartial.maybeFromJson(null), isNull);
    });
  });
}
