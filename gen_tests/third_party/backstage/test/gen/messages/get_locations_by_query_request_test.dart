// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetLocationsByQueryRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetLocationsByQueryRequest();
      final parsed = GetLocationsByQueryRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetLocationsByQueryRequest.maybeFromJson(null), isNull);
    });
  });
}
