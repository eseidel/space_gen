// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposListAttestations200ResponseAttestationsInnerBundle', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          ReposListAttestations200ResponseAttestationsInnerBundle();
      final parsed =
          ReposListAttestations200ResponseAttestationsInnerBundle.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposListAttestations200ResponseAttestationsInnerBundle.maybeFromJson(
          null,
        ),
        isNull,
      );
    });
  });
}
