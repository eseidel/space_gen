// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('GetStations200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetStations200Response();
      final parsed = GetStations200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetStations200Response.maybeFromJson(null), isNull);
    });
  });
}
