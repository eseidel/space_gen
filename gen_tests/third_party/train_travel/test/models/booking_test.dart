// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('Booking', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Booking();
      final parsed = Booking.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Booking.maybeFromJson(null), isNull);
    });
  });
}
