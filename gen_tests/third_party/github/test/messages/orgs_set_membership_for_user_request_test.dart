// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsSetMembershipForUserRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsSetMembershipForUserRequest();
      final parsed = OrgsSetMembershipForUserRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsSetMembershipForUserRequest.maybeFromJson(null), isNull);
    });
  });
}
