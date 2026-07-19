// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GistsUpdateRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GistsUpdateRequest();
      final parsed = GistsUpdateRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GistsUpdateRequest.maybeFromJson(null), isNull);
    });
  });
}
