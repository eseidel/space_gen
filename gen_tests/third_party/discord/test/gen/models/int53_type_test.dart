// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('Int53Type', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Int53Type(-9007199254740991);
      final parsed = Int53Type.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Int53Type.maybeFromJson(null), isNull);
    });
  });
}
