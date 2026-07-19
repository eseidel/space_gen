// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotCreateOrUpdateOrgSecretRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependabotCreateOrUpdateOrgSecretRequest(
        visibility: DependabotCreateOrUpdateOrgSecretRequestVisibility.all,
      );
      final parsed = DependabotCreateOrUpdateOrgSecretRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependabotCreateOrUpdateOrgSecretRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotCreateOrUpdateOrgSecretRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
