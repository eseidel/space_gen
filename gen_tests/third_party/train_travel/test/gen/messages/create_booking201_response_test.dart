// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('CreateBooking201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CreateBooking201Response();
      final parsed = CreateBooking201Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateBooking201Response.maybeFromJson(null), isNull);
    });
  });
}
