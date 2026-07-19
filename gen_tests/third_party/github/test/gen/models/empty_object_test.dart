// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('EmptyObject', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EmptyObject();
      final parsed = EmptyObject.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EmptyObject.maybeFromJson(null), isNull);
    });
  });
}
