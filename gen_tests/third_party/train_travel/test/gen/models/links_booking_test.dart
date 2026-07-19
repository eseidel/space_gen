// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('LinksBooking', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = LinksBooking();
      final parsed = LinksBooking.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LinksBooking.maybeFromJson(null), isNull);
    });
  });
}
