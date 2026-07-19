// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('GetTrips200ResponseAllOf2Links', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetTrips200ResponseAllOf2Links();
      final parsed = GetTrips200ResponseAllOf2Links.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetTrips200ResponseAllOf2Links.maybeFromJson(null), isNull);
    });
  });
}
