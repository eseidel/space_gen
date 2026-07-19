// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SnowflakeType', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SnowflakeType('0');
      final parsed = SnowflakeType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SnowflakeType.maybeFromJson(null), isNull);
    });
  });
}
