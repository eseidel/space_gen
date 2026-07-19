// GENERATED — do not hand-edit.
import 'package:const_property/api.dart';
import 'package:test/test.dart';

void main() {
  group('Marker', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Marker();
      final parsed = Marker.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Marker.maybeFromJson(null), isNull);
    });
  });
}
