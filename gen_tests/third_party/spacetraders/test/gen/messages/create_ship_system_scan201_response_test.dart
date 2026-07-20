// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateShipSystemScan201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreateShipSystemScan201Response(
        data: CreateShipSystemScan201ResponseData(
          cooldown: Cooldown(
            shipSymbol: 'example',
            totalSeconds: 0,
            remainingSeconds: 0,
          ),
          systems: <ScannedSystem>[
            ScannedSystem(
              symbol: 'example',
              sectorSymbol: 'example',
              type: SystemType.neutronStar,
              x: 0,
              y: 0,
              distance: 0,
            ),
          ],
        ),
      );
      final parsed = CreateShipSystemScan201Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateShipSystemScan201Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CreateShipSystemScan201Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
