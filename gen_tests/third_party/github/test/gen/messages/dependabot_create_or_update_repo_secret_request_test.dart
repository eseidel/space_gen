// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotCreateOrUpdateRepoSecretRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DependabotCreateOrUpdateRepoSecretRequest();
      final parsed = DependabotCreateOrUpdateRepoSecretRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependabotCreateOrUpdateRepoSecretRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
