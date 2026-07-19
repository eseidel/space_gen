// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsUpdateMembershipForAuthenticatedUserRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsUpdateMembershipForAuthenticatedUserRequest(
        state: OrgsUpdateMembershipForAuthenticatedUserRequestState.active,
      );
      final parsed =
          OrgsUpdateMembershipForAuthenticatedUserRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OrgsUpdateMembershipForAuthenticatedUserRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgsUpdateMembershipForAuthenticatedUserRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
