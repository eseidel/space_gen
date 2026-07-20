// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CredentialsRevokeRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CredentialsRevokeRequest(
        credentials: const <String>['example'],
      );
      final parsed = CredentialsRevokeRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CredentialsRevokeRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CredentialsRevokeRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
