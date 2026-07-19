// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsListAttestations200ResponseAttestationsInnerBundle', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsListAttestations200ResponseAttestationsInnerBundle();
      final parsed =
          OrgsListAttestations200ResponseAttestationsInnerBundle.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OrgsListAttestations200ResponseAttestationsInnerBundle.maybeFromJson(
          null,
        ),
        isNull,
      );
    });
  });
}
