// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsListAttestations200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsListAttestations200Response();
      final parsed = OrgsListAttestations200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsListAttestations200Response.maybeFromJson(null), isNull);
    });
  });
}
