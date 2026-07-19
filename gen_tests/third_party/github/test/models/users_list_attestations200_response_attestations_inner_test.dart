// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('UsersListAttestations200ResponseAttestationsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UsersListAttestations200ResponseAttestationsInner();
      final parsed =
          UsersListAttestations200ResponseAttestationsInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        UsersListAttestations200ResponseAttestationsInner.maybeFromJson(null),
        isNull,
      );
    });
  });
}
