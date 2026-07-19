// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('UsersListAttestations200ResponseAttestationsInnerBundle', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          UsersListAttestations200ResponseAttestationsInnerBundle();
      final parsed =
          UsersListAttestations200ResponseAttestationsInnerBundle.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        UsersListAttestations200ResponseAttestationsInnerBundle.maybeFromJson(
          null,
        ),
        isNull,
      );
    });
  });
}
