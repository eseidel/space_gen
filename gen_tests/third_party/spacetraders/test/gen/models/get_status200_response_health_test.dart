// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetStatus200ResponseHealth', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetStatus200ResponseHealth();
      final parsed = GetStatus200ResponseHealth.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetStatus200ResponseHealth.maybeFromJson(null), isNull);
    });
  });
}
