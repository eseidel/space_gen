// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('GetBooking200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetBooking200Response();
      final parsed = GetBooking200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetBooking200Response.maybeFromJson(null), isNull);
    });
  });
}
