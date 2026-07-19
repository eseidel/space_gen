// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('EntitiesQueryResponsePageInfo', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EntitiesQueryResponsePageInfo();
      final parsed = EntitiesQueryResponsePageInfo.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EntitiesQueryResponsePageInfo.maybeFromJson(null), isNull);
    });
  });
}
