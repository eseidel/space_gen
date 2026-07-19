// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateShipShipScan201ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CreateShipShipScan201ResponseData(
        cooldown: const Cooldown(
          shipSymbol: 'example',
          totalSeconds: 0,
          remainingSeconds: 0,
        ),
        ships: <ScannedShip>[
          ScannedShip(
            symbol: 'example',
            registration: const ShipRegistration(
              name: 'example',
              factionSymbol: 'example',
              role: ShipRole.fabricator,
            ),
            nav: ShipNav(
              systemSymbol: SystemSymbol('example'),
              waypointSymbol: WaypointSymbol('example'),
              route: ShipNavRoute(
                destination: ShipNavRouteWaypoint(
                  symbol: 'example',
                  type: WaypointType.planet,
                  systemSymbol: SystemSymbol('example'),
                  x: 0,
                  y: 0,
                ),
                origin: ShipNavRouteWaypoint(
                  symbol: 'example',
                  type: WaypointType.planet,
                  systemSymbol: SystemSymbol('example'),
                  x: 0,
                  y: 0,
                ),
                departureTime: DateTime.utc(2024),
                arrival: DateTime.utc(2024),
              ),
              status: ShipNavStatus.inTransit,
              flightMode: ShipNavFlightMode.drift,
            ),
            engine: const ScannedShipEngine(symbol: 'example'),
          ),
        ],
      );
      final parsed = CreateShipShipScan201ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateShipShipScan201ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateShipShipScan201ResponseData.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
