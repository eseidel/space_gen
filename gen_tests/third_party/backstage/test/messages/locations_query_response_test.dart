// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('LocationsQueryResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = LocationsQueryResponse(
        items: <Location>[
          Location(
            target: 'example',
            type: 'example',
            id: 'example',
            entityRef: 'example',
          ),
        ],
        totalItems: 0,
        pageInfo: LocationsQueryResponsePageInfo(),
      );
      final parsed = LocationsQueryResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LocationsQueryResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LocationsQueryResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
