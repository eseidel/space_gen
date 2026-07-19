// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('GetBookings200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetBookings200Response();
      final parsed = GetBookings200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetBookings200Response.maybeFromJson(null), isNull);
    });
  });
}
