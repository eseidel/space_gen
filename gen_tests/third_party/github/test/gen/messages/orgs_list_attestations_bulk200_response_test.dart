// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsListAttestationsBulk200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsListAttestationsBulk200Response();
      final parsed = OrgsListAttestationsBulk200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsListAttestationsBulk200Response.maybeFromJson(null), isNull);
    });
  });
}
