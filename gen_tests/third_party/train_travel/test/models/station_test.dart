// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('Station', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Station(
        id: '00000000-0000-0000-0000-000000000000',
        name: 'Berlin Hauptbahnhof',
        address: 'Invalidenstraße 10557 Berlin, Germany',
        countryCode: 'DE',
      );
      final parsed = Station.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Station.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Station.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
