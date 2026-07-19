// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Meta', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Meta(total: 0, limit: 1);
      final parsed = Meta.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Meta.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Meta.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
