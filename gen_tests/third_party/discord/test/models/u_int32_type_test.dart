// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UInt32Type', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UInt32Type(0);
      final parsed = UInt32Type.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UInt32Type.maybeFromJson(null), isNull);
    });
  });
}
