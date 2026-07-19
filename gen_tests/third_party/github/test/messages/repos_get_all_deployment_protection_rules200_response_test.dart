// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposGetAllDeploymentProtectionRules200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposGetAllDeploymentProtectionRules200Response();
      final parsed =
          ReposGetAllDeploymentProtectionRules200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposGetAllDeploymentProtectionRules200Response.maybeFromJson(null),
        isNull,
      );
    });
  });
}
