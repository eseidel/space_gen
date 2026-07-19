// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesCreateWithRepoForAuthenticatedUserRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodespacesCreateWithRepoForAuthenticatedUserRequest();
      final parsed =
          CodespacesCreateWithRepoForAuthenticatedUserRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesCreateWithRepoForAuthenticatedUserRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
