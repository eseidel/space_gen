// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('GetBookings200ResponseAllOf2Links', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetBookings200ResponseAllOf2Links();
      final parsed = GetBookings200ResponseAllOf2Links.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetBookings200ResponseAllOf2Links.maybeFromJson(null), isNull);
    });
  });
}
