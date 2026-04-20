// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('UuidType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UuidType('00000000-0000-0000-0000-000000000000');
      final parsed = UuidType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UuidType.maybeFromJson(null), isNull);
    });
  });
}
