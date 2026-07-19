// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetLocations200ResponseInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetLocations200ResponseInner(
        data: Location(
          target: 'example',
          type: 'example',
          id: 'example',
          entityRef: 'example',
        ),
      );
      final parsed = GetLocations200ResponseInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetLocations200ResponseInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetLocations200ResponseInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
