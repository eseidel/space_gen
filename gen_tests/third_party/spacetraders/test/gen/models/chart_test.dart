// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('Chart', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Chart(
        waypointSymbol: WaypointSymbol('example'),
        submittedBy: 'example',
        submittedOn: DateTime.utc(2024),
      );
      final parsed = Chart.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Chart.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Chart.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
