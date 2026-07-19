// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsUpdatePatAccessRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsUpdatePatAccessRequest(
        action: OrgsUpdatePatAccessRequestAction.revoke,
      );
      final parsed = OrgsUpdatePatAccessRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsUpdatePatAccessRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgsUpdatePatAccessRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
