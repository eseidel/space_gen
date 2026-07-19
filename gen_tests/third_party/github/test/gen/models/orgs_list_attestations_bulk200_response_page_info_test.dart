// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsListAttestationsBulk200ResponsePageInfo', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsListAttestationsBulk200ResponsePageInfo();
      final parsed = OrgsListAttestationsBulk200ResponsePageInfo.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OrgsListAttestationsBulk200ResponsePageInfo.maybeFromJson(null),
        isNull,
      );
    });
  });
}
