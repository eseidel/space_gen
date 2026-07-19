// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('GetTrips200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetTrips200Response();
      final parsed = GetTrips200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetTrips200Response.maybeFromJson(null), isNull);
    });
  });
}
